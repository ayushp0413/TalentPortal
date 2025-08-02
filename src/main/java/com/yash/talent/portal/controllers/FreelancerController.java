package com.yash.talent.portal.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.yash.talent.portal.exceptions.*;
import com.yash.talent.portal.model.*;
import com.yash.talent.portal.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;


@Controller
public class FreelancerController {

    @Autowired
    private FreelancerService freelancerService;

    @Autowired
    private ProjectPostService projectPostService;

    @Autowired
    private JobPostService jobPostService;

    @Autowired
    private JobApplicationService jobApplicationService;

    @Autowired
    private ProjectApplicationService projectApplicationService;

    @RequestMapping("/registerFreelancer")
    public String showRegisterFreelancer()
    {
        return "registerFreelancer";
    }

    @RequestMapping("/loginFreelancer")
    public String showLoginFreelancer()
    {
        return "loginFreelancer";
    }

    @RequestMapping(path = "/submitFreelancerRegistration", method = RequestMethod.POST)
    public String submitFreelancerRegistration(@ModelAttribute("freelancer") Freelancer freelancer, @RequestParam("profilef") CommonsMultipartFile profile, HttpServletRequest request, Model model) throws IOException {
        System.out.println("Freelancer: " + freelancer);
        System.out.println("Profile: "+ profile);

        if(freelancer.getPassword().equals(freelancer.getConfirmPassword()))
        {
            // hashing Password
            String hashedPassword = BCrypt.withDefaults().hashToString(12, freelancer.getPassword().toCharArray() );
            freelancer.setPassword(hashedPassword);
            freelancer.setConfirmPassword(null);


            // File Storage Logic

            String path  = request.getServletContext().getRealPath("/")+ "WEB-INF" + File.separator + "files" + File.separator + "serverImgs" + File.separator + profile.getOriginalFilename();
            System.out.println("PATH : "+ path);

            try
            {
                byte[] data = profile.getBytes();
                FileOutputStream fos = new FileOutputStream(path);
                fos.write(data);
                fos.close();
                System.out.println("File Uploaded Successfully!!");
                freelancer.setProfile(profile.getOriginalFilename());

                // database logic

                this.freelancerService.addFreelancer(freelancer);

            }catch (DuplicateFreelancerException e)
            {
                model.addAttribute("errMsg", e.getMessage());
                return "registerFreelancer";
            }
            model.addAttribute("succMsg","Registration Successful! Please Login to continue.");
            return "loginFreelancer";
        }
        model.addAttribute("errMsg","Invalid Credential! Please try again.");
        return "registerFreelancer";
    }

    @RequestMapping(path = "/submitFreelancerLogin", method = RequestMethod.POST)
    public String submitFreelancerLogin(@RequestParam("email") String email, @RequestParam("password") String password, RedirectAttributes redirectAttributes, HttpSession session, Model model)
    {
        // Fetch the Freelancer from email
        Freelancer freelancer = this.freelancerService.getFreelancerByEmail(email);

        if(freelancer == null)
        {
            System.out.println("Freelancer not found with this email");
            redirectAttributes.addFlashAttribute("errMsg", "Invalid Email address");
            return "redirect:/loginFreelancer";
        }

        // Verify Password
        boolean result = BCrypt.verifyer().verify(password.toCharArray(), freelancer.getPassword()).verified;
        if(!result)
        {
            System.out.println("Invalid Password");
            redirectAttributes.addFlashAttribute("errMsg", "Invalid Password");
            return "redirect:/loginFreelancer";
        }

        // all set
        System.out.println("Freelancer is Logged In Successfully");
        model.addAttribute("freelancer", freelancer);
        session.setAttribute("email", freelancer.getEmail());
        session.setAttribute("loggedInFreelancer", freelancer); // it is like token store in node.js
        return "redirect:/homeFreelancer";
    }


    @RequestMapping("/homeFreelancer")
    public String homeFreelancer(HttpSession session, Model model)
    {
        if(session.getAttribute("email") == null)
        {
            return "redirect:/loginFreelancer";
        }

        model.addAttribute("freelancer", session.getAttribute("loggedInFreelancer"));
        return "homeFreelancer";
    }


    @RequestMapping("/logoutFreelancer")
    public String logoutFreelancer(HttpSession session)
    {
        session.invalidate();
        return "redirect:/loginFreelancer";
    }

    @RequestMapping("/profileFreelancer")
    public String profileFreelancer(HttpSession session, Model model)
    {
        model.addAttribute("freelancer", session.getAttribute("loggedInFreelancer"));
        return "profileFreelancer";
    }

    @RequestMapping(path = "/updateFreelancer", method = RequestMethod.POST)
    public String updateFreelancer(@ModelAttribute("freelancer") Freelancer freelancer, @RequestParam("profilef") CommonsMultipartFile profile, HttpServletRequest request,  Model model) throws IOException {
        System.out.println("Freelancer: "+ freelancer);

        try
        {
            if(!profile.isEmpty()) {
                System.out.println("Profile: " + profile.getOriginalFilename());
                // File Storage Logic
                String path = request.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "files" + File.separator + "serverImgs" + File.separator + profile.getOriginalFilename();
                System.out.println("PATH : " + path);

                byte[] data = profile.getBytes();
                FileOutputStream fos = new FileOutputStream(path);
                fos.write(data);
                fos.close();
                System.out.println("File Uploaded Successfully!!");
                freelancer.setProfile(profile.getOriginalFilename());

            }
            // database logic
            this.freelancerService.updateFreelancer(freelancer);

        }catch (DuplicateFreelancerException e)
        {
            model.addAttribute("errMsg", e.getMessage());
            return "registerFreelancer";
        }
        model.addAttribute("succMsg","Profile Update Successful! Please Login to continue.");
        return "loginFreelancer";
    }

    @RequestMapping(path = "/updateProfileFreelancer", method = RequestMethod.POST)
    public String updateFreelancerProfile(@ModelAttribute("freelancer") Freelancer freelancer, @RequestParam("profilef") CommonsMultipartFile profile, HttpServletRequest request, Model model) throws IOException {

        System.out.println("Freelancer details for update: "+ freelancer);

        try
        {
            if(!profile.isEmpty()) {
                System.out.println("Profile: " + profile.getOriginalFilename());
                // File Storage Logic
                String path = request.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "files" + File.separator + "serverImgs" + File.separator + profile.getOriginalFilename();
                System.out.println("PATH : " + path);

                byte[] data = profile.getBytes();
                FileOutputStream fos = new FileOutputStream(path);
                fos.write(data);
                fos.close();
                System.out.println("File Uploaded Successfully!!");
                freelancer.setProfile(profile.getOriginalFilename());

            }
            // database logic
            this.freelancerService.updateFreelancer(freelancer);

        }catch (DuplicateFreelancerException e)
        {
            model.addAttribute("errMsg", e.getMessage());
            return "registerFreelancer";
        }
        model.addAttribute("succMsg","Profile Update Successful! Please Login to continue.");
        return "loginFreelancer";
    }

    @RequestMapping("/Explorejobs")
    public String showExploreJobs(Model model)
    {
        // before returning, get the available jobs o the portal
        List<ShowJobs> showAllJobs =  this.jobPostService.showAllJobs();
        System.out.println("Printing data at controller: "+ showAllJobs);

        // set this in Model and send
        model.addAttribute("jobdata", showAllJobs);

        return "Explorejobs";
    }


    @RequestMapping("/Exploreproject")
    public String showExploreProjects(Model model)
    {
        List<ProjectPost> projects = this.projectPostService.showAllProjects();
        System.out.println("Projects: "+ projects);
        model.addAttribute("projectData", projects);
        return "exploreProject";
    }


    // now let's apply for the job
    @RequestMapping("/viewAndApply/{id}")
    public String showViewAndApplyPage(@PathVariable("id") int id, Model model)
    {
        // get data of JOB POST from the id of company
        JobPost jobData = this.jobPostService.showJobById(id);
        System.out.println("Getting data forView and Apply job: "+ jobData);

        model.addAttribute("jobData", jobData);
        return "viewAndApplyJob";
    }

    @RequestMapping("/viewAndApplyProject/{id}")
    public String showViewAndApplyProjectPage(@PathVariable("id") int id, Model model)
    {

        ProjectPost projectData = this.projectPostService.showProjectById(id);
        System.out.println("Getting data for View and Apply Project : "+ projectData);
        model.addAttribute("projectData", projectData);
        return "viewAndApplyProject";
    }


    @RequestMapping(path = "/applyJob", method = RequestMethod.POST)
    public String applyJob(@ModelAttribute("jobApplication") JobApplication jobApplication, @RequestParam("resume") CommonsMultipartFile resume, HttpServletRequest request,  Model model) throws IOException
    {

        // File Storage Logic
        String path = request.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "files" + File.separator + "serverImgs" + File.separator + resume.getOriginalFilename();
        System.out.println("PATH : " + path);

        byte[] data = resume.getBytes();
        FileOutputStream fos = new FileOutputStream(path);
        fos.write(data);
        fos.close();
        System.out.println("File Uploaded Successfully!!");
        jobApplication.setFreelancerResume(resume.getOriginalFilename());

        // object is ready store in db
        try {
            this.jobApplicationService.createJobApplication(jobApplication);
        } catch (JobApplicationException e) {
            model.addAttribute("errMsg", e.getMessage());
            return showExploreJobs(model);
        }
        model.addAttribute("succMsg", "You Job Application has been submitted successfully!");
        return showExploreJobs(model);
    }


    @RequestMapping(path = "/applyProject", method = RequestMethod.POST)
    public String applyProject(@ModelAttribute("projectApplication") ProjectApplication projectApplication, @RequestParam("resume") CommonsMultipartFile resume, HttpServletRequest request,  Model model) throws IOException
    {

        // File Storage Logic
        String path = request.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "files" + File.separator + "serverImgs" + File.separator + resume.getOriginalFilename();
        System.out.println("PATH : " + path);

        byte[] data = resume.getBytes();
        FileOutputStream fos = new FileOutputStream(path);
        fos.write(data);
        fos.close();
        System.out.println("File Uploaded Successfully!!");
        projectApplication.setFreelancerResume(resume.getOriginalFilename());

        // object is ready store in db
        try {
            this.projectApplicationService.createProjectApplication(projectApplication);
        } catch (ProjectApplicationException e) {
            model.addAttribute("errMsg", e.getMessage());
            return showExploreProjects(model);
        }
        model.addAttribute("succMsg", "You Project Application has been submitted successfully!");
        return showExploreProjects(model);
    }


    @RequestMapping("/myApplications/{email}")
    public String showAllApplications(@PathVariable("email") String email, Model model)
    {

        System.out.println("email: "+ email );

        // getting all job applications
        List<JobApplication> jobs = this.jobApplicationService.getAllJobApplications(email);
        System.out.println("Applied Jobs: "+ jobs);

        List<ProjectApplication> projects = this.projectApplicationService.getAllProjectApplications(email);
        System.out.println("Applied Projects: "+ projects);


        if ((jobs == null || jobs.isEmpty()) && (projects == null || projects.isEmpty())) {
            model.addAttribute("errMsg", "You haven't applied for any Jobs or Projects");
        } else {
            if (jobs == null || jobs.isEmpty()) {
                model.addAttribute("jobMsg", "You haven't applied for any Jobs");
            } else {
                model.addAttribute("appliedJobs", jobs);
            }

            if (projects == null || projects.isEmpty()) {
                model.addAttribute("projectMsg", "You haven't applied for any Projects");
            } else {
                model.addAttribute("appliedProjects", projects);
            }
        }

        return "myApplications";
    }


    @RequestMapping("/viewAllFreelancers")
    public ModelAndView showAllFreelancers()
    {
        List<Freelancer> freelancers = this.freelancerService.getAllFreelancers();
        System.out.println("Freelancers: "+ freelancers);
        if (freelancers == null || freelancers.isEmpty()) {
            System.out.println("No freelancers registered.");
        }
        ModelAndView mv = new ModelAndView();
        mv.addObject("freelancers", freelancers);
        mv.setViewName("viewAllFreelancers");
        return mv;
    }
}
