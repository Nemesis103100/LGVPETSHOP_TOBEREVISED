
<!-- Header-->

<script src="jquery.min.js"></script>
<link href="libs/style.css" rel='stylesheet' type='text/css' />
<link href="bootstrap2.css" rel='stylesheet' type='text/css' />
<link href="style2.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="fwslider.css" media="all">

<script src="jquery-ui.min.js"></script>
<script src="fwslider.js"></script>
 <div class="features">
        
		<div class="container">
			<h3 class="m_3">Features</h3>
			<div class="close_but"><i class="close1"> </i></div>
			  <div class="row">
				<div class="col-md-3 top_box">
					<div class="view view-ninth"><a href="single.html">
                    <a  href="products.php">
                    <img src="images/pic2.jpg" class="img-responsive" alt=""/>
                    <div class="mask mask-1"> </div>
                    <div class="mask mask-2"> </div>
                      <div class="content">
                        <h2>Cats</h2>
                        <p>You can make me meow!</p>
                      </div>
                    </a> </div>
                   <h4 class="m_4"><a href=""><center>CATS</center></a></h4>
                   <p class="m_5"><center>Products</center></p>
				</div>
				<div class="col-md-3 top_box">
					<div class="view view-ninth"><a href="single.html">
                    <img src="images/pic3.jpg" class="img-responsive" alt=""/>
                    <div class="mask mask-1"> </div>
                    <div class="mask mask-2"> </div>
                      <div class="content">
                        <h2>Fish</h2>
                        <p>Water is very essential.</p>
                      </div>
                    </a> </div>
                   <h4 class="m_4"><a href="#"><center>FISH</center></a></h4>
                   <p class="m_5"><center>Products</center></p>
				</div>
				<div class="col-md-3 top_box1">
					<div class="view view-ninth"><a href="single.html">
                    <img src="images/pic4.jpg" class="img-responsive" alt=""/>
                    <div class="mask mask-1"> </div>
                    <div class="mask mask-2"> </div>
                      <div class="content">
                        <h2>Birds</h2>
                        <p>Birds that flocks together, stays together.</p>
                      </div>
                     </a> </div>
                   <h4 class="m_4"><a href="#"><center>BIRDS</center></a></h4>
                   <p class="m_5"><center>Products</center></p>
				</div>
        <div class="col-md-3 top_box">
					<div class="view view-ninth"><a href="single.html">
                    <img src="images/pic1.jpg" class="img-responsive" alt=""/>
                    <div class="mask mask-1"> </div>
                    <div class="mask mask-2"> </div>
                      <div class="content">
                        <h2>Dogs </h2>
                        <p>Simple treat and I'll bark</p>
                      </div>
                    </a> </div>
                   <h4 class="m_4"><a href="#"><center>DOGS</center></a></h4>
                   <p class="m_5"><center>Products</center></p>
			</div>
		 </div>
        </div>
    </div>

    <div class="container">
			<h3 class="m_3">Products</h3>
			<div class="close_but"><i class="close1"> </i></div>
<!-- Section-->

<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <?php 

                // CONNECTING TO DATABASE

                $products = $conn->query("SELECT * FROM `products` where status = 1 order by id limit 8 ");
    
                while($row = $products->fetch_assoc()):
                    $upload_path = base_app.'/uploads/product_'.$row['id'];
                    $img = "";
                    if(is_dir($upload_path)){
                        $fileO = scandir($upload_path);
                        if(isset($fileO[2]))
                        //product image
                            $img = "uploads/product_".$row['id']."/".$fileO[2];
                        // var_dump($fileO);
                    }
                    $inventory = $conn->query("SELECT * FROM inventory where product_id = ".$row['id']);
                    $inv = array();
                    while($ir = $inventory->fetch_assoc()){

                        // Product Price
                        $inv[$ir['size']] = number_format($ir['price']);
                    }
            ?>
            <div class="col mb-5">
                <div class="card h-100 product-item">
                    <!-- Product image-->
                    <img class="card-img-top w-100" src="<?php echo validate_image($img) ?>" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><?php echo $row['product_name'] ?></h5>
                            <!-- Product price-->
                            <?php foreach($inv as $k=> $v): ?>
                                <span><b><?php echo $k ?>: </b><?php echo $v ?></span>
                            <?php endforeach; ?>
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a style="background-color: #FFE57C;" class="btn btn-flat text-dark "   href=".?p=view_product&id=<?php echo md5($row['id']) ?>">View</a>
                        </div>
                        
                    </div>
                </div>
            </div>
            <?php endwhile; ?>
        </div>
    </div>
</section>