<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Gestion employes</title>
    <script src="JQUERY/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>

    <style type="text/css">
        a{
            text-align: center;
            text-decoration: none;
        }
        a:hover{
            text-align: center;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="container">

    <header class="page-header">
        Recherche formation
    </header>

    <div class="ALL">

        <form action="" method="post">

            <div class="form-group">
                <label for="region">Region</label>
                <select name="region" id="region" class="form-control">
                    <option value="">************</option>
                    <option value="Kaolack">Kaolack</option>
                    <option value="Dakar">Dakar</option>
                    <option value="Thies">Thies</option>
                </select>
            </div>

            <div class="form-group">
                <label for="ecole">Ecole</label>
                <select name="ecole" id="ecole" class="form-control">
                    <option value="">************</option>
                    <option value="ISI KAOLACK">ISI KAOLACK</option>
                    <option value="ISI DAKAR">ISI DAKAR</option>
                    <option value="ISI KAFFRINE">ISI KAFFRINE</option>
                    <option value="SGML">SGML</option>
                </select>
            </div>

            <div class="form-group">
                <label for="format">Formation</label>
                <select name="format" id="format" class="form-control">
                    <option value="">************</option>
                    <option value="Genie logiciel">Genie logiciel</option>
                    <option value="Reseau">Reseau</option>
                    <option value="Autres"> Autres </option>
                </select>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <input type="submit" class="btn btn-default btn-lg btn-block btn-success" name="btn" id="btn" value="Postuler"/>
                </div>
            </div>

        </form>

    </div>

</div>

</body>
</html>





<?php 

    $server = "localhost";
    $login = "root";
    $bd = "gestFormat";
    $psw = "";

    $bdd = new mysqli($server, $login, $psw, $bd);
    if($bdd->connect_error)
    {
        echo "Erreur : " .$bdd->connect_error;
    }
    else
    {
        if (isset($_POST['btn'])) {

	        $region = $_POST['region'];
	        $ecole = $_POST['ecole'];
	        $format = $_POST['format'];
	        $neant = "";

	           
	        $selectReq = 
	        '
	            SELECT * FROM formation NATURAL JOIN Description WHERE formation.idFormat = Description.idFormat  
	            	AND
	                (region LIKE "%' .$region. '%" OR region LIKE "% '.$neant.' %")AND

	                (ecole LIKE "%' .$ecole. '%" OR ecole LIKE "% '.$neant.' %") AND
	                  
	                (format LIKE "%' .$format. '%" OR format LIKE "% '.$neant.' %")
	        ';

?>


		     <table class="table table-striped table-bordered table-hover table-condensed text-center">
		           <tr>
		               <th>Region</th>
		               <th>Ecole</th>
		               <th>Formation</th>
		               <th>Description</th>
		               <th>Argent</th>
		               <th>Choisir</th>
		           </tr>
		    
<?php  


		    $res = $bdd->query($selectReq);
				if ($res->num_rows > 0) {
				    while($row = $res->fetch_assoc()) {
			
?>
		            <tr>
		                <td><?php echo $row['region']; ?></td>
		                <td><?php echo $row['ecole']; ?></td>
		                <td><?php echo $row['format']; ?></td>
		                <td><?php echo $row['description']; ?></td>
		                <td><?php echo $row['argent']; ?></td>
		                <td> 
			                <a href="index.php?idFormat=<?php echo $row['idFormat']; ?>"> 
			                	Choisir 
			                </a>
		                </td>
		            </tr>
		                    
<?php 
		        	} 
		    	} 
		} 



		if (isset($_GET['idFormat'])) {
        $idFormat = $bdd->real_escape_string($_GET['idFormat']);

        $selectReq = "SELECT region, ecole, description, argent FROM formation NATURAL JOIN Description WHERE formation.idFormat = Description.idFormat AND formation.idFormat = $idFormat";
        echo $idFormat;
        $result = $bdd->query($selectReq);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $region = $bdd->real_escape_string($row['region']);
            $ecole = $bdd->real_escape_string($row['ecole']);
            $description = $bdd->real_escape_string($row['description']);
            $argent = $bdd->real_escape_string($row['argent']);

            $insertReq = "INSERT INTO choix (region, ecole, description, argent, idFormat) 
                          VALUES ('$region', '$ecole', '$description', '$argent', $idFormat)";

            if ($bdd->query($insertReq) === TRUE) {
                echo "Data inserted into the 'choix' table successfully!";
            } else {
                echo "Error: " . $bdd->error;
            }
        } else {
            echo "No data found for the selected 'idFormat'.";
        }
    }

$bdd->close();
	} 

?>