using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE101_CONTRIBUTE
{
    public partial class RiderRegistry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set up validation controls
            if (!IsPostBack)
            {
                rfvFirstName.ErrorMessage = "First name is required.";
                rfvLastName.ErrorMessage = "Last name is required.";
                rfvEmail.ErrorMessage = "Email is required.";
                rfvPhoneNumber.ErrorMessage = "Phone number is required.";
                rfvEmergencyContactName.ErrorMessage = "Emergency contact name is required.";
                rfvEmergencyContactPhoneNumber.ErrorMessage = "Emergency contact phone number is required.";
                rfvDriversLicenseNumber.ErrorMessage = "Driver's license number is required.";
                CvDriversLicenseNumber.ErrorMessage = "Invalid driver's license number.";
                CvDriversLicenseNumber.ServerValidate += ValidateDriversLicenseNumber;
                CvDriversLicenseImage.ErrorMessage = "Invalid file type. Only JPG, JPEG, and PNG files are allowed.";
                CvDriversLicenseImage.ServerValidate += CvDriversLicenseImage_ServerValidate;


                CvBirthdate.ErrorMessage = "You must be at least 18 years old to register.";
                

                // Address validation
                rfvAddress.ErrorMessage = "Address is required.";
            }
        }
        protected void CvBirthdate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!string.IsNullOrEmpty(TxtBirthdate.Text))
            {
                DateTime birthdate;
                if (DateTime.TryParse(TxtBirthdate.Text, out birthdate))
                {
                    // Calculate age
                    int age = DateTime.Today.Year - birthdate.Year;
                    if (birthdate > DateTime.Today.AddYears(-age))
                        age--;

                    // Check if age is less than 18
                    if (age < 18)
                    {
                        args.IsValid = false;
                        return;
                    }
                }
            }
            args.IsValid = true;
        }

        protected void CvDriversLicenseImage_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string extension = System.IO.Path.GetExtension(FuDriversLicenseImage.FileName).ToLower();
            args.IsValid = extension == ".jpg" || extension == ".jpeg" || extension == ".png";
        }

        protected void ValidateDriversLicenseNumber(object source, ServerValidateEventArgs args)
        {
            string driversLicenseNumber = args.Value;
            bool isValid = Regex.IsMatch(driversLicenseNumber, @"^[A-Za-z0-9]{8,10}$");
            args.IsValid = isValid;
        }


        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            // Validate form inputs
            if (!Page.IsValid)
            {
                return;
            }

            // Get form inputs
            string firstName = TxtFirstName.Text;
            string lastName = TxtLastName.Text;
            string email = TxtEmail.Text;
            string phoneNumber = TxtPhoneNumber.Text;
            string birthdate = TxtBirthdate.Text;
            string address = TxtAddress.Text;
            string emergencyContactName = TxtEmergencyContactName.Text;
            string emergencyContactPhoneNumber = TxtEmergencyContactPhoneNumber.Text;
            string driversLicenseNumber = TxtDriversLicenseNumber.Text;
            string driversLicenseImageUrl = SaveDriversLicenseImage();

            // Save form inputs to database or perform other actions
            // ...

            // Redirect to confirmation page
            Response.Redirect("Confirmation.aspx");
        }

        private string SaveDriversLicenseImage()
        {
            // Save the uploaded image to a directory and return its URL
            // ...

            return "~/Images/DriversLicenses/" + FuDriversLicenseImage.FileName;
        }
    
}
}