<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<?php 
$total = 0;
    $qry = $conn->query("SELECT c.*,p.product_name,i.size,i.price,p.id as pid from `cart` c inner join `inventory` i on i.id=c.inventory_id inner join products p on p.id = i.product_id where c.client_id = ".$_settings->userdata('id'));
    while($row= $qry->fetch_assoc()):
        $total += $row['price'] * $row['quantity'];
    endwhile;
?>
<section class="py-5">
    <div class="container">
        <div class="card rounded-0">
            <div class="card-body"></div>
            <h3 class="text-center"><b>Complete Order</b></h3>
            <hr class="border-dark">
            <form action="" id="manage-user">  
                <input type="hidden" name="transaction_id" value="<?php echo $_GET['transaction_id'] ?>">
                <input type="hidden" name="paid" value="1">
                
                <div class="row row-col-1 justify-content-center">
                    <div class="col-12 row">
                    <div class="col-9">
                        <div class="form-group border p-5" style="height: 600px;">
                        <div class="m-auto bg-white position-relative border" style="width: 300px;height: 100%;">
                          <span class="text-muted" style="font-size: 5rem;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);"><i class="fas fa-cloud-upload-alt"></i></span>
                          <span class="text-muted font-weight-bold" style="font-size: 1.5rem;position: absolute;top: 65%;left: 50%;transform: translate(-50%,-65%);">PAYMENT</span>

                          <img id="uploadedImage" src="#" alt="Uploaded Image" accept="image/png, image/jpeg" style="display:none;position: absolute;top: 0;" width="100%" height="100%">
                          <input type="file" name="img" id="proof" class="custom-file-input form-control border-0 h-100 w-100 position-absolute" style="opacity: 0;" onchange="displayImg(this,$(this))" required>
                           
                        </div>
                      </div>
                    </div>
                      <div class="col-3">
                            <img src="images/qr.jpg" width="100%">
                        </div>
                        <div class="col my-4">
                            <div class="d-flex w-100 justify-content-between">
                                <input name="reference" class="btn-flat pl-2 border text-left" placeholder="Reference" required>
                                <button style="background-color: #FFE57C;" class="btn btn-flat" >Complete Order</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
      

   
        </div>
    </div>
</section>
<script>
document.getElementById('proof').addEventListener('change', function(){
      if (this.files[0] ) {
        var picture = new FileReader();
        picture.readAsDataURL(this.files[0]);
        picture.addEventListener('load', function(event) {
          document.getElementById('uploadedImage').setAttribute('src', event.target.result);
          document.getElementById('uploadedImage').style.display = 'block';
        });
        }
      });

function displayImg(input,_this) {
        console.log(input.files)
        var fnames = []
        Object.keys(input.files).map(k=>{
            fnames.push(input.files[k].name)
        })
        _this.siblings('.custom-file-label').html(JSON.stringify(fnames))
        
    }


   $('#manage-user').submit(function(e){
        e.preventDefault();
        start_loader()
        $.ajax({
            url:_base_url_+'classes/Master.php?f=gcash_order',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success:function(resp){
                if(resp ==1){
                     alert_toast("Order Successfully placed.","success")
                     setTimeout(function(){
                            location.replace('./')
                     
                    },2000)
                }else{
                    
                    end_loader()
                }
            }
        })
    })


    
          
      

</script>