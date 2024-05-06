<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RiderRegistry.aspx.cs" Inherits="SE101_CONTRIBUTE.RiderRegistry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PET SHOP </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            margin-top: 5in;
            background-color: #efecd0;
            border-radius: 10px;
            box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.1), -10px -10px 20px rgba(255, 255, 255, 0.1);
            padding: 40px;
            width: 500px;
            height: 975px;
            margin-bottom; 5in;
            
        }

        h1 {
            border-bottom: 1px solid #ddd;
            margin-top: 0;
            padding-bottom: 10px;
            text-align:center;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"]{
            background-color: #f5f5f5;
            border: none;
            border-radius: 5px;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1), -5px -5px 10px rgba(255, 255, 255, 0.1);
            padding: 10px;
            width: 3.5in;
            margin-top:15px;
        }

        input[type="file"]{
            background-color: #f5f5f5;
            border: none;
            border-radius: 5px;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1), -5px -5px 10px rgba(255, 255, 255, 0.1);
            padding: 10px;
            width: 1.9in;
            margin-top:9px;
        }

        input[type="submit"] {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1), -5px -5px 10px rgba(255, 255, 255, 0.1);
            color: #fff;
            cursor: pointer;
            padding: 10px;
            width: 200px; /* Set a specific width */
            transition: all 0.3s ease-in-out;
            margin: 20px auto; /* Center horizontally with auto margins */
            display: block; /* Ensure block-level display for margin auto to work */

        }

        input[type="submit"]:hover {
            background-color: #0062cc;
        }

        .error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }

        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Rider Registration</h1>
            <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red" />
            <table>
                <tr>
                    <td>First Name:</td>
                    <td><asp:TextBox ID="TxtFirstName" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="TxtFirstName" ErrorMessage="First name is required." ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><asp:TextBox ID="TxtLastName" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="TxtLastName" ErrorMessage="Last name is required." ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>Birthdate:</td>
                    <td><asp:TextBox ID="TxtBirthdate" runat="server" placeholder="MM/DD/YYYY" /></td>
                    <td><asp:CustomValidator ID="CvBirthdate" runat="server" ControlToValidate="TxtBirthdate" ErrorMessage="You must be at least 18 years old to register." ForeColor="Red" OnServerValidate="CvBirthdate_ServerValidate"></asp:CustomValidator></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><asp:TextBox ID="TxtAddress" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="TxtAddress" ErrorMessage="Address is required." ForeColor="Red" /></td>
                </tr>

                <tr>
                    <td>Email:</td>
                    <td><asp:TextBox ID="TxtEmail" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Email is required." ForeColor="Red" /></td>
                    <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><asp:TextBox ID="TxtPhoneNumber" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="TxtPhoneNumber" ErrorMessage="Phone number is required." ForeColor="Red" /></td>
                    <td><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtPhoneNumber" ErrorMessage="Invalid phone number format." ValidationExpression="^(09|08|07)[0-9]{9}$" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>Emergency Contact Name:</td>
                    <td><asp:TextBox ID="TxtEmergencyContactName" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rfvEmergencyContactName" runat="server" ControlToValidate="TxtEmergencyContactName" ErrorMessage="Emergency contact name is required." ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>Emergency Contact Phone Number:</td>
                    <td><asp:TextBox ID="TxtEmergencyContactPhoneNumber" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rfvEmergencyContactPhoneNumber" runat="server" ControlToValidate="TxtEmergencyContactPhoneNumber" ErrorMessage="Emergency contact phone number is required." ForeColor="Red" /></td>
                    <td><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtEmergencyContactPhoneNumber" ErrorMessage="Invalid phone number format." ValidationExpression="^(09|08|07)[0-9]{9}$" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td>Driver's License Number:</td>
                    <td><asp:TextBox ID="TxtDriversLicenseNumber" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rfvDriversLicenseNumber" runat="server" ControlToValidate="TxtDriversLicenseNumber" ErrorMessage="Driver's license number is required." ForeColor="Red" /></td>
                    <td><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TxtDriversLicenseNumber" ErrorMessage="Invalid driver's license format." ValidationExpression="^[A-Z]{2}\d{12}$" ForeColor="Red" /></td>
                    <td><asp:CustomValidator ID="CvDriversLicenseNumber" runat="server" ControlToValidate="TxtDriversLicenseNumber" ErrorMessage="Invalid driver's license number." ForeColor="Red"></asp:CustomValidator></td>
                </tr>
                <tr>
                    <td>Driver's License Image:</td>
                    <td><asp:FileUpload ID="FuDriversLicenseImage" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rfvDriversLicenseImage" runat="server" ControlToValidate="FuDriversLicenseImage" ErrorMessage="Driver's license image is required." ForeColor="Red" /></td>
                    <td><asp:CustomValidator ID="CvDriversLicenseImage" runat="server" ControlToValidate="FuDriversLicenseImage" ErrorMessage="Invalid file type. Only JPG, JPEG" ForeColor="Red"></asp:CustomValidator></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID="BtnSubmit" runat="server" Text="Register" OnClick="BtnSubmit_Click" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
