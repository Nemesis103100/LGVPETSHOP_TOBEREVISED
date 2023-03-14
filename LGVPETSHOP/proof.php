<?php
// $image = $_FILES['image']['tmp_name'];
//         move_uploaded_file($image, $image);


        $fileImg = $_FILES['fileImg']['name'];
        move_uploaded_file($_FILES['fileImg']['tmp_name'], "uploads/".$fileImg);
        $resp['status'] == 1;

        ?>