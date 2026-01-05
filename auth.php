<?php

// Function to login
function login($conn, $param)
{
    // Check if email and password are set
    if (!isset($param['email']) || !isset($param['password'])) {
        return array('status' => false, 'message' => 'Email and password are required.');
    }

    // Prepare the SQL statement
    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->bind_param("s", $param['email']);
    
    // Execute the statement
    $stmt->execute();
    $res = $stmt->get_result();

    if ($res->num_rows > 0) {
        $user = mysqli_fetch_assoc($res);
        $hash = $user['password'];

        if (password_verify($param['password'], $hash)) {
            $result = array('status' => true, 'user' => $user);
        } else {
            $result = array('status' => false, 'message' => 'Invalid password.');
        }
    } else {
        $result = array('status' => false, 'message' => 'User  not found.');
    }

    // Close the statement
    $stmt->close();
    
    return $result;
}


// Function to change password
function changePassword($conn, $param)
{
    extract($param);
    $hash = $_SESSION['user']['password'];
    if (password_verify($current_pass, $hash)) {
        if ($new_pass == $conf_pass) {
            $hash = password_hash($new_pass, PASSWORD_DEFAULT);

            // Update password
            $sql = "UPDATE users SET password = '$hash' where id = " . $_SESSION['user']['id'];
            $conn->query($sql);
            $result = array('status' => true, "message" => "Password has been changed successfully");
        } else {
            $result = array('status' => false, "message" => "Confirm password doesn't match");
        }
    } else {

        $result = array('status' => false, "message" => "Invalid current password");
    }




    return $result;
}

// Function to update profile
function updateProfile($conn, $param)
{
    extract($param);

    //Upload image start
    $uploadTo = "assets/uploads/";
    $allowedFileTypes = array("jpg", "png", "jpeg", "gif");
    $fileName = $_FILES['profile_pic']['name'];
    $tempPath = $_FILES['profile_pic']['tmp_name'];

    //$basename = basename($fileName);
    $originalPath = $uploadTo . $fileName;
    $fileType = pathinfo($originalPath, PATHINFO_EXTENSION);

    if (!empty($fileName)) {
        if (in_array($fileType, $allowedFileTypes)) {
            $upload = move_uploaded_file($tempPath, $originalPath);
        } else {
            $result = array('status' => false, "message" => "Invalid file formate");
            return $result;
        }
    }
    //Upload image end


    $user_id = $_SESSION['user']['id'];
    $datetime = date("Y-m-d H:i:s");
    $sql = "UPDATE users SET 
        name = '$name', 
        email = '$email', 
        phone_no = '$phone_no',
        updated_at = '$datetime'";

    if (isset($upload)) {
        $sql .= ",profile_pic = '$fileName'";
        $_SESSION['user']['profile_pic'] = $fileName;
    }

    $sql .= " WHERE id = $user_id";
    $conn->query($sql);

    // Update session user data
    $_SESSION['user']['name'] = $name;
    $_SESSION['user']['email'] = $email;
    $_SESSION['user']['phone_no'] = $phone_no;

    $result = array('status' => true, "message" => "Profile has been updated successfully");
    return $result;
}
