<?php
// Function to create student
function create($conn, $param)
{
    extract($param);

    ## Validation start
    if (empty($name)) {
        $result = array("error" => "Name is required");
        return $result;
    }
    ## Validation end

    $datetime = date("Y-m-d H:i:s");
    $sql = "INSERT INTO categories (name, created_at)
        VALUES ('$name','$datetime')";
    $result['success'] = $conn->query($sql);
    return $result;
}
function getCategories($conn)
{
    $sql = "select * from categories order by id desc";
    $result = $conn->query($sql);
    return $result;
}
// Function to get all students
function getCategoryByid($conn, $id)
{
    $sql = "select * from categories where id = $id";
    $result = $conn->query($sql);
    return $result;
}


// Function to update
function update($conn, $param)
{
    extract($param);
    ## Validation start
    if (empty($name)) {
        $result = array("error" => "Name is required");
        return $result;
    }
    
    ## Validation end

    $datetime = date("Y-m-d H:i:s");
    $sql = "UPDATE categories SET 
        name = '$name' 
        WHERE id = $id;
        ";
    $result['success'] = $conn->query($sql);
    return $result;
}


// Function to delete
function delete($conn, $id)
{
    $sql = "DELETE FROM categories WHERE id = $id";
    $result = $conn->query($sql);
    return $result;
    echo $id;
}
?>



