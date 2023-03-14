<?php
  include '../conn.php';
 

?>




    <!-- Content Header (Page header) -->
    <section>
      <h1 style="text-align: center">LGV Pet Shop</h1>
      <h4 style="text-align: center">#158 B Sampaguita Street Maligaya Park Subdivision Novaliches, Novaliches, Quezon City, 1118 Metro Manila
</h4>
      <h4 style="text-align: center">(63)915 888 2887</h4>
      <h4 style="text-align: center">lgvpetshop@gmail.com</h4>

      <br>
      <div>
        <h2 style="text-align: center;">Sales Report</h2>
        <h4 style="float: left;">Date: <?php echo date('F j, Y') ?></h4>
      </div>
      

    </section>

 
              <table width="100%">
                <thead>
                  <th style="text-align: left;">#</th>
            <th style="text-align: left;">Date Order</th>
            <th style="text-align: left;">Client</th>
            <th style="text-align: left;">Total Amount</th>
            <th style="text-align: left;">Status</th>
                </thead>
                <tbody>


        <?php


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
            

            while($row = $qry->fetch_assoc()):
          

        ?>
        
                         <tr>
              <td class="text-center"><?php echo $i++; ?></td>
              <td><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
              <td><?php echo $row['client'] ?></td>
              <td class="text-right"><?php echo number_format($row['amount']) ?></td>
              
              <td class="text-center">
                                <?php if($row['status'] == 0): ?>
                                    <span class="badge badge-light">Pending</span>
                                <?php elseif($row['status'] == 1): ?>
                                    <span class="badge badge-primary">Packed</span>
                <?php elseif($row['status'] == 2): ?>
                                    <span class="badge badge-warning">Out for Delivery</span>
                <?php elseif($row['status'] == 3): ?>
                                    <span class="badge badge-success">Delivered</span>
                                <?php else: ?>
                                    <span class="badge badge-danger">Cancelled</span>
                                <?php endif; ?>
                            </td>
              
            </tr>
          <?php endwhile; ?>



                </tbody>
              </table>
            

<script>



     window.print();
    
  window.onafterprint = window.close; 

</script>



