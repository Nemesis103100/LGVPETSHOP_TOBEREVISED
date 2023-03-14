<?php if($_settings->chk_flashdata('success')): ?>
<script>
  alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<?php if($_settings->chk_flashdata('error')): ?>
<script>
  alert_toast("<?php echo $_settings->flashdata('error') ?>",'error')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
  <div class="card-header">
    <h3 class="card-title">Sales Report</h3>
    <!-- <div class="card-tools">
      <a href="?page=order/manage_order" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Create New</a>
    </div> -->
  </div>
  <div class="card-body">
    <?php


    if (isset($_POST['search'])) {
      $searchtxt = $_POST['searchtxt'];

      if ($searchtxt == 'Daily'  OR $searchtxt == 'Weekly' OR $searchtxt == 'Monthly' OR $searchtxt == 'Yearly') {
        echo "<script>window.location.href='?salesreport=".$searchtxt."';</script>";
      }else{
        echo "<script>window.location.href='./';</script>";
      }
    
    }
    ?>
    <div class="form-group text-right">
      <div class="float-left">
        <a href="print.php?<?php if(isset($_GET['salesreport'])){ echo "salesreport=".$_GET['salesreport']; } ?>" class="btn btn-success" target="_blank">Print</a>
        <a href="export.php?<?php if(isset($_GET['salesreport'])){ echo "salesreport=".$_GET['salesreport']; } ?>" class="btn btn-success" target="_blank">Export</a>
      </div>
      <form method="POST">
        <select name="searchtxt" class="w-25 btn btn-flat btn-sm text-left salesreport">
          <option value="">Select</option>
          <option value="Daily">Daily</option>
          <option value="Weekly">Weekly</option>
          <option value="Monthly">Monthly</option>
          <option value="Yearly">Yearly</option>
        </select>
        <button name="search" class="btn btn-primary btn-flat btn-sm">Search</button>
      </form>
    </div>
    <div class="container-fluid">
        <div class="container-fluid">
      <table class="table table-bordered table-stripped">
        <colgroup>
          <col width="5%">
          <col width="15%">
          <col width="25%">
          <col width="20%">
          <col width="10%">
          <col width="10%">
        </colgroup>
        <thead>
          <tr>
            <th>#</th>
            <th>Date Order</th>
            <th>Client</th>
            <th>Total Amount</th>
            <th>Paid</th>
            <th>Status</th>
          </tr>
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
                                <?php if($row['paid'] == 0): ?>
                                    <span class="badge badge-light">No</span>
                                <?php else: ?>
                                    <span class="badge badge-success">Yes</span>
                                <?php endif; ?>
                            </td>
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
    </div>
    </div>
  </div>
</div>
<script>
  $(document).ready(function(){
    $('.delete_data').click(function(){
      _conf("Are you sure to delete this order permanently?","delete_order",[$(this).attr('data-id')])
    })
    $('.pay_order').click(function(){
      _conf("Are you sure to mark this order as paid?","pay_order",[$(this).attr('data-id')])
    })
    $('.table').dataTable();
  })


  $('.salesreport').change(function(){

  })
</script>