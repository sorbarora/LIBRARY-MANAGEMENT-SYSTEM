<?php

// Function to get system counts
function getCounts($conn)
{
    $counts = array(
        'total_books' => 0,
        'total_students' => 0,
        'total_loans' => 0,
        'total_category' => 0,
    );

    ## Get books count
    $sql = "select count(id) as total_books from books";
    $res = $conn->query($sql);
    if ($res->num_rows > 0) {
        $books = mysqli_fetch_assoc($res);
        $counts['total_books'] = $books['total_books'];
    }

    ## Get students count
    $sql = "select count(id) as total_students from students";
    $res = $conn->query($sql);
    if ($res->num_rows > 0) {
        $books = mysqli_fetch_assoc($res);
        $counts['total_students'] = $books['total_students'];
    }

    ## Get loans count
    $sql = "select count(id) as total_loans from book_loans";
    $res = $conn->query($sql);
    if ($res->num_rows > 0) {
        $books = mysqli_fetch_assoc($res);
        $counts['total_loans'] = $books['total_loans'];
    }
    $sql = "select count(id) as total_category from categories";
    $res = $conn->query($sql);
    if ($res->num_rows > 0) {
        $books = mysqli_fetch_assoc($res);
        $counts['total_category'] = $books['total_category'];
    }
 
    return $counts;
}

// Function to get tab data
function getTabData($conn)
{
    $tabs = array(
        'students' => array(),
        'loans' => array(),
        'subscriptions' => array(),
    );

    ## Get recent students
    $sql = "select * from students order by id desc limit 5";
    $res = $conn->query($sql);
    if ($res->num_rows > 0) {
        while ($row = $res->fetch_assoc()) {
            $tabs['students'][] = $row;
        }
    }

    ## Get recent loans
    $sql = "select l.*, b.title as book_title, s.name as student_name 
        from book_loans l
        inner join books b on b.id = l.book_id
        inner join students s on s.id = l.student_id
        order by l.id desc limit 5";
    $res = $conn->query($sql);
    if ($res->num_rows > 0) {
        while ($row = $res->fetch_assoc()) {
            $tabs['loans'][] = $row;
        }
    }


    return $tabs;
}
