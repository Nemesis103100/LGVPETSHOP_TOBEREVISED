<?php

  include '../conn.php';
$output = '';
             $i = 1;
          if (isset($_GET['salesreport'])) {

            if ($_GET['salesreport'] == 'Daily') {
              $today = date('Y-m-d');
              $qry = $conn->query("SELECT o.*,concat(c.firstname,' ',c.lastname) as client from `orders` o inner join clients c on c.id = o.client_id  WHERE o.status = 3 AND o.date_created = '$today' order by unix_timestamp(o.date_created) desc ");
            }else if ($_GET['salesreport'] == 'Weekly') {
                
              $today = date('Y-m-d');
              $past = date('Y-m-d', strtotime('-7 days'));
    
              $qry = $conn->query("SELECT o.*,concat(c.firstname,' ',c.lastname) as client from `orders` o inner join clients c on c.id = o.client_id  WHERE o.status = 3 AND o.date_created >= '$past' AND o.date_created <= '$today' order by unix_timestamp(o.date_created) desc ");
            }else if ($_GET['salesreport'] == 'Monthly') {
                
              $firstday = date('Y-m-d', strtotime('first day of this month'));
              $lastday = date('Y-m-d', strtotime('last day of this month'));
    
              $qry = $conn->query("SELECT o.*,concat(c.firstname,' ',c.lastname) as client from `orders` o inner join clients c on c.id = o.client_id  WHERE o.status = 3 AND o.date_created >= '$firstday' AND o.date_created <= '$lastday' order by unix_timestamp(o.date_created) desc ");
            }else if ($_GET['salesreport'] == 'Yearly') {
                
              $yearly = date('Y');
    
              $qry = $conn->query("SELECT o.*,concat(c.firstname,' ',c.lastname) as client from `orders` o inner join clients c on c.id = o.client_id  WHERE o.status = 3 AND o.yearly = '$yearly' order by unix_timestamp(o.date_created) desc ");
            }

          }else{
            $qry = $conn->query("SELECT o.*,concat(c.firstname,' ',c.lastname) as client from `orders` o inner join clients c on c.id = o.client_id  WHERE o.status = 3 order by unix_timestamp(o.date_created) desc ");
          }


 
                  $output .= '
                  <h3 style="text-align: center">Pet Shop Food and Accessories Shop</h3>
                   <table class="table" bordered="1">  
                        <tr>  
                         
                            <th>Date Order</th>
                            <th>Client</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                        </tr>
                  ';
                    while($row = $qry->fetch_assoc())
                  {
                   $output .= '
                    <tr>  
                        <td>'.date("Y-m-d H:i",strtotime($row['date_created'])) .'</td>
                        <td>'.$row['client'] .'</td>
                        <td>'.number_format($row['amount']) .'</td>
                        <td>Delivered</td>
                    </tr>
                   ';
                  }
                  $output .= '</table>';
                  header('Content-Type: application/xls');
                  header('Content-Disposition: attachment; filename=download.xls');
                  echo $output;
                 


            
            ?>