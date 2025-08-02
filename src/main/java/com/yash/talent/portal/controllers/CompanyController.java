package com.yash.talent.portal.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.yash.talent.portal.exceptions.*;
import com.yash.talent.portal.model.*;
import com.yash.talent.portal.services.*;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;

@Controller
public class CompanyController extends Object  {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private JobPostService jobPostService;

    @Autowired
    private ProjectPostService projectPostService;

    @Autowired
    private JobApplicationService jobApplicationService;

    @Autowired
    private ProjectApplicationService projectApplicationService;

    // To display the Registration form
    @RequestMapping("/registerCompany")
    public String showCompanyRegiForm()
    {
        return "registerCompany";
    }


    // to show Login Form
    @RequestMapping("/loginCompany")
    public String showCompanyLoginForm()
    {
        return "loginCompany";
    }


    // submitting registration form
    @RequestMapping(path = "/submitCompanyRegistration", method = RequestMethod.POST)
    public String submitCompanyRegiForm(@ModelAttribute("company") Company company, @RequestParam("profilec") CommonsMultipartFile profile, HttpServletRequest request, Model model) throws IOException {

        if(company.getPassword().equals(company.getConfirmPassword()))
        {
            // hashing Password
            String hashedPassword = BCrypt.withDefaults().hashToString(12, company.getPassword().toCharArray() );
            company.setPassword(hashedPassword);
            company.setConfirmPassword(null);



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
                company.setProfile(profile.getOriginalFilename());

                // database logic

                this.companyService.addCompany(company);

            }catch (DuplicateCompanyException e)
            {
                model.addAttribute("errMsg", e.getMessage());
                return "registerCompany";
            }
            model.addAttribute("succMsg","Registration Successful! Please Login to continue.");
            return "loginCompany";
        }
        model.addAttribute("errMsg","Invalid Credential! Please try again.");
        return "registerCompany";
    }


    // When company login to system
    @RequestMapping(path = "/submitCompanyLogin", method = RequestMethod.POST)
    public String submitCompanyLoginForm(@RequestParam("email") String email, @RequestParam("password") String password, RedirectAttributes redirectAttributes, HttpSession session, Model model)
    {

        // Fetch the Company from email
        Company company = this.companyService.getCompanyByEmail(email);

        if(company == null)
        {
            System.out.println("Company not found with this email");
            redirectAttributes.addFlashAttribute("errMsg", "Invalid Email address");
            return "redirect:/loginCompany";
        }

        // Verify Password
        boolean result = BCrypt.verifyer().verify(password.toCharArray(), company.getPassword()).verified;
        if(!result)
        {
            System.out.println("Invalid Password");
            redirectAttributes.addFlashAttribute("errMsg", "Invalid Password");
            return "redirect:/loginCompany";
        }

        // all set
        System.out.println("Company is Logged In Successfully");
        model.addAttribute("company", company);
        session.setAttribute("email", company.getEmail());
        session.setAttribute("loggedInCompany", company); // it is like token store in node.js
        return "redirect:/homeCompany";
    }

    @RequestMapping("/homeCompany")
    public String showHomeCompany(HttpSession session, Model model)
    {
        if(session.getAttribute("email") == null)
        {
            return "redirect:/loginCompany";
        }

        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "homeCompany";
    }

    @RequestMapping("/logoutCompany")
    public String logoutCompany(HttpSession session)
    {
        session.invalidate(); // clear session
        return "redirect:/loginCompany";
    }


    @RequestMapping("/profileCompany")
    public String showCompanyProfile(HttpSession session, Model model)
    {
        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "profileCompany";
    }


    @RequestMapping(path = "/updateCompany", method = RequestMethod.POST)
    public String updateCompany(@ModelAttribute("company") Company company, @RequestParam("profilec") CommonsMultipartFile profile, HttpServletRequest request,  Model model) throws IOException {
        System.out.println("Company detailes for update: "+ company);

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
                company.setProfile(profile.getOriginalFilename());

            }
            // database logic
            this.companyService.updateCompany(company);

        }catch (DuplicateCompanyException e)
        {
            model.addAttribute("errMsg", e.getMessage());
            return "registerCompany";
        }
        model.addAttribute("succMsg","Profile Update Successful! Please Login to continue.");
        return "loginCompany";
    }


    // Job Post
    @RequestMapping("/showpostjob")
    public String showJobPost(HttpSession session, Model model)
    {
        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "postjob";
    }

    @RequestMapping(path = "/submitpostjob", method = RequestMethod.POST)
    public String submitJobPost(@ModelAttribute("jobPost") JobPost jobPost, Model model)
    {
        System.out.println("Job Post: "+ jobPost);
        try
        {
            this.jobPostService.createJob(jobPost);

        }catch(JobPostException e)
        {
            model.addAttribute("errMsg", e.getMessage());
            return "postjob";
        }
        model.addAttribute("succMsg","Job Created Successfully!");
        return "homeCompany";
    }


    // Projects POST
    @RequestMapping("/showpostproject")
    public String showJProjectPost(HttpSession session, Model model)
    {
        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "postproject";
    }

    @RequestMapping(path = "/submitPostProject", method = RequestMethod.POST)
    public String submitPostProject(@ModelAttribute("projectPost") ProjectPost projectPost, @RequestParam("projectfile") CommonsMultipartFile projectfile, HttpServletRequest request,  Model model) throws IOException {

        System.out.println("Data : "+ projectPost);
        System.out.println("project file: "+ projectfile);

        // File Upload code

        String path  = request.getServletContext().getRealPath("/")+ "WEB-INF" + File.separator + "files" + File.separator + "serverImgs" + File.separator + projectfile.getOriginalFilename();
        System.out.println("PATH : "+ path);

        try
        {
            byte[] data = projectfile.getBytes();
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(data);
            fos.close();
            System.out.println("File Uploaded Successfully!!");
            projectPost.setProjectPdf(projectfile.getOriginalFilename());

            // database logic
            this.projectPostService.createProject(projectPost);

        }catch (ProjectPostException e)
        {
            model.addAttribute("errMsg", e.getMessage());
            return "submitPostProject";
        }
        model.addAttribute("succMsg","Project Post Created Successfully!");
        return "homeCompany";
    }


    @RequestMapping("/applications/{email}")
    public String showAllApplications(@PathVariable("email") String email, Model model, HttpSession session)
    {

        System.out.println("email: "+ email );

        // getting all job applications
        List<JobApplication> jobs = this.jobApplicationService.getAllJobApplicationsByCompanyEmail(email);
        System.out.println("Applied Jobs: "+ jobs);

        List<ProjectApplication> projects = this.projectApplicationService.getAllProjectApplicationsByCompanyEmail(email);
        System.out.println("Applied Projects: "+ projects);


        if ((jobs == null || jobs.isEmpty()) && (projects == null || projects.isEmpty())) {
            model.addAttribute("errMsg", "No pending Jobs or Projects Applications");
        } else {
            if (jobs == null || jobs.isEmpty()) {
                model.addAttribute("jobMsg", "No pending Jobs Applications");
            } else {
                model.addAttribute("appliedJobs", jobs);
            }

            if (projects == null || projects.isEmpty()) {
                model.addAttribute("projectMsg", "No pending Projects Applications");
            } else {
                model.addAttribute("appliedProjects", projects);
            }
        }
        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "applications";
    }

    @RequestMapping(path = "/updateJobStatus", method = RequestMethod.POST)
    public String updateJobStatus(@RequestParam("id") int id, @RequestParam("status") String status, Model model, HttpSession session)
    {
        System.out.println("Id: "+ id);
        System.out.println("Status: "+ status);

        try {
            JobApplication jobApplication = this.jobApplicationService.getJobApplicationById(id);
            System.out.println("printing data: "+ jobApplication);
            jobApplication.setStatus(status);
            // data is ready to update
            this.jobApplicationService.updateJobApplication(jobApplication);
            System.out.println("Job Status updated");

        } catch (JobApplicationException e) {
            model.addAttribute("errMsg", e.getMessage());
            model.addAttribute("company", session.getAttribute("loggedInCompany"));
            return "messageCompany";
        }

        model.addAttribute("succMsg", "Job Status Updated Successfully!");
        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "messageCompany";
    }


    @RequestMapping(path = "/updateProjectStatus", method = RequestMethod.POST)
    public String updateProjectStatus(@RequestParam("id") int id, @RequestParam("status") String status, Model model, HttpSession session)
    {
        System.out.println("Id: "+ id);
        System.out.println("Status: "+ status);

        try {
            ProjectApplication projectApplication = this.projectApplicationService.getProjectApplicationById(id);
            System.out.println("printing data: "+ projectApplication);
            projectApplication.setStatus(status);
            // data is ready to update
            this.projectApplicationService.updateProjectApplication(projectApplication);
            System.out.println("Project Status updated");

        } catch (ProjectApplicationException e) {
            model.addAttribute("errMsg", e.getMessage());
            model.addAttribute("company", session.getAttribute("loggedInCompany"));
            return "messageCompany";
        }

        model.addAttribute("succMsg", "Project Status Updated Successfully!");
        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "messageCompany";
    }


    @RequestMapping("/acceptedApplications/{email}")
    public String acceptedJobApplications(@PathVariable("email") String email, Model model, HttpSession session)
    {
        System.out.println("Email: "+ email);

        List<JobApplication> acceptedJobApplications = this.jobApplicationService.getAllAcceptedJobApplications(email);
        System.out.println("Accepted Jobs: "+ acceptedJobApplications);

        List<ProjectApplication> acceptedProjectApplications = this.projectApplicationService.getAllAcceptedProjectApplications(email);
        System.out.println("Accepted Projects: "+ acceptedProjectApplications);

        if ((acceptedJobApplications == null || acceptedJobApplications.isEmpty()) && (acceptedProjectApplications == null || acceptedProjectApplications.isEmpty())) {
            model.addAttribute("errMsg", "No Accepted Jobs or Projects Applications");
        } else {
            if (acceptedJobApplications == null || acceptedJobApplications.isEmpty()) {
                model.addAttribute("jobMsg", "No Accepted Jobs");
            } else {
                model.addAttribute("acceptedJobs", acceptedJobApplications);
            }

            if (acceptedProjectApplications == null || acceptedProjectApplications.isEmpty()) {
                model.addAttribute("projectMsg", "No Accepted Projects");
            } else {
                model.addAttribute("acceptedProjects", acceptedProjectApplications);
            }
        }
        return "acceptedApplications";
    }


    @RequestMapping("/rejectedApplications/{email}")
    public String rejectedJobApplications(@PathVariable("email") String email, Model model, HttpSession session)
    {

        List<JobApplication> rejectedJobApplications = this.jobApplicationService.getAllRejectedJobApplications(email);
        System.out.println("Rejected Jobs: "+ rejectedJobApplications);

        List<ProjectApplication> rejectedProjectApplications = this.projectApplicationService.getAllRejectedProjectApplications(email);
        System.out.println("rejected Projects: "+ rejectedProjectApplications);

        if ((rejectedJobApplications == null || rejectedJobApplications.isEmpty()) && (rejectedProjectApplications == null || rejectedProjectApplications.isEmpty())) {
            model.addAttribute("errMsg", "No rejected Jobs or Projects Applications");
        } else {
            if (rejectedJobApplications == null || rejectedJobApplications.isEmpty()) {
                model.addAttribute("jobMsg", "No rejected Jobs");
            } else {
                model.addAttribute("rejectedJobs", rejectedJobApplications);
            }

            if (rejectedProjectApplications == null || rejectedProjectApplications.isEmpty()) {
                model.addAttribute("projectMsg", "No rejected Projects");
            } else {
                model.addAttribute("rejectedProjects", rejectedProjectApplications);
            }
        }
        return "rejectedApplications";
    }


    @RequestMapping("/manageJobAndProjects/{email}")
    public String manageJobAndProjects(@PathVariable("email") String email, Model model, HttpSession session)
    {
        // Fetching all job posts
        List<JobPost> jobPosts = this.jobPostService.getAllJobsByEmail(email);
        System.out.println("Job Posts: " + jobPosts);

        // Fetching all project posts
        List<ProjectPost> projectPosts = this.projectPostService.getAllProjectsByEmail(email);
        System.out.println("Project Posts: " + projectPosts);

        if ((jobPosts == null || jobPosts.isEmpty()) && (projectPosts == null || projectPosts.isEmpty())) {
            model.addAttribute("errMsg", "No Jobs or Projects to manage");
        } else {
            if (jobPosts == null || jobPosts.isEmpty()) {
                model.addAttribute("jobMsg", "No Jobs to manage");
            } else {
                model.addAttribute("jobPosts", jobPosts);
            }

            if (projectPosts == null || projectPosts.isEmpty()) {
                model.addAttribute("projectMsg", "No Projects to manage");
            } else {
                model.addAttribute("projectPosts", projectPosts);
            }
        }

        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "manageJobAndProjects";
    }

    @RequestMapping("/editJobPost/{id}")
    public String editJobPostData(@PathVariable("id") int id, Model model, HttpSession session)
    {
        System.out.println("Job Post ID: " + id);

        JobPost jobPost = this.jobPostService.showJobById(id);
        System.out.println("Job Post Details: " + jobPost);

        if (jobPost == null) {
            model.addAttribute("errMsg", "Job Post not found");
            return "manageJobAndProjects";
        }

        model.addAttribute("jobPost", jobPost);
        model.addAttribute("company", session.getAttribute("loggedInCompany"));

        return "editJobPost";
    }


    // updating the job in DB
    @RequestMapping(path = "/updateJobPost", method = RequestMethod.POST)
    public String updateJobPost(@ModelAttribute("jobPost") JobPost jobPost, Model model, HttpSession session)
    {
        System.out.println("Job Post to update: " + jobPost);
        try
        {
            this.jobPostService.updateJob(jobPost);
            model.addAttribute("succMsg", "Job Post updated successfully!");
        } catch (JobPostException e) {
            model.addAttribute("errMsg", e.getMessage());
        }

        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "homeCompany";
    }



    @RequestMapping("/deleteJobPost/{id}")
    public String deleteJobPost(@PathVariable("id") int id, Model model, HttpSession session)
    {
        System.out.println("Job Post ID to delete: " + id);

        try
        {
            this.jobPostService.deleteJobById(id);
            model.addAttribute("succMsg", "Job Post deleted successfully!");
        } catch (JobPostException e) {
            model.addAttribute("errMsg", e.getMessage());
        }

        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "messageCompany";
    }


    @RequestMapping("/deleteProjectPost/{id}")
    public String deleteProjectPost(@PathVariable("id") int id, Model model, HttpSession session) {
        System.out.println("Project Post ID to delete: " + id);

        try {
            this.projectPostService.deleteProjectById(id);
            model.addAttribute("succMsg", "Project Post deleted successfully!");
        } catch (ProjectPostException e) {
            model.addAttribute("errMsg", e.getMessage());
        }

        model.addAttribute("company", session.getAttribute("loggedInCompany"));
        return "messageCompany";
    }


    @RequestMapping("/viewAllCompanies")
    public String showAllCompanies(Model model)
    {
        List<Company> companies = this.companyService.getAllCompanies();
        System.out.println("All Companies: " + companies);
        if (companies == null || companies.isEmpty()) {
            model.addAttribute("errMsg", "No Companies Listed");
        } else {
            model.addAttribute("companies", companies);
        }
        return "viewAllCompanies";
    }
}


