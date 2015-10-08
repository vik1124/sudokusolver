<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link data-require="bootstrap-css@3.3.1" data-semver="3.3.1" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="/static/Vik.css" type="text/css" />
<title>Sudoku Solver</title>
<style type="text/css">
	input[type="number"] {
   width:40px;
   font-weight:bold;
}
tr.border_bottom td {
  border-bottom:3pt solid black;
}
tr.border_top td {
  border-top:3pt solid black;
}
td.border_left{
  border-left:3pt solid black;
}
td.border_right{
  border-right:3pt solid black;
}
</style>
</head>

<body>
<div class="container">

	<h1> Sudoku Solver </h1>
	<br />
	<br />
	<form role="form" action="solve" method="GET">
	  <div class="form-group">
	  <table width="300">
	 	<tr class="border_top">
	    	<td class="border_left">
				<input type="number" name="n00" value="{{n00}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n01" value="{{n01}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n02" value="{{n02}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n03" value="{{n03}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n04" value="{{n04}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n05" value="{{n05}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n06" value="{{n06}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n07" value="{{n07}}" max="9" min="1">
			</td>
			<td class="border_right">
				<input type="number" name="n08" value="{{n08}}" max="9" min="1">
			</td>
		</tr>
		<tr>
	    	<td class="border_left">
				<input type="number" name="n10" value="{{n10}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n11" value="{{n11}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n12" value="{{n12}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n13" value="{{n13}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n14" value="{{n14}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n15" value="{{n15}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n16" value="{{n16}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n17" value="{{n17}}" max="9" min="1">
			</td>
			<td class="border_right">
				<input type="number" name="n18" value="{{n18}}" max="9" min="1">
			</td>
		</tr>
		<tr class="border_bottom">
	    	<td class="border_left">
				<input type="number" name="n20" value="{{n20}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n21" value="{{n21}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n22" value="{{n22}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n23" value="{{n23}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n24" value="{{n24}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n25" value="{{n25}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n26" value="{{n26}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n27" value="{{n27}}" max="9" min="1">
			</td>
			<td class="border_right">
				<input type="number" name="n28" value="{{n28}}" max="9" min="1">
			</td>
		</tr>
		<tr>
	    	<td class="border_left">
				<input type="number" name="n30" value="{{n30}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n31" value="{{n31}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n32" value="{{n32}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n33" value="{{n33}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n34" value="{{n34}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n35" value="{{n35}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n36" value="{{n36}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n37" value="{{n37}}" max="9" min="1">
			</td>
			<td class="border_right">
				<input type="number" name="n38" value="{{n38}}" max="9" min="1">
			</td>
		</tr>
		<tr>
	    	<td class="border_left">
				<input type="number" name="n40" value="{{n40}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n41" value="{{n41}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n42" value="{{n42}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n43" value="{{n43}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n44" value="{{n44}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n45" value="{{n45}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n46" value="{{n46}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n47" value="{{n47}}" max="9" min="1">
			</td>
			<td class="border_right">
				<input type="number" name="n48" value="{{n48}}" max="9" min="1">
			</td>
		</tr>
		<tr class="border_bottom">
	    	<td class="border_left">
				<input type="number" name="n50" value="{{n50}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n51" value="{{n51}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n52" value="{{n52}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n53" value="{{n53}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n54" value="{{n54}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n55" value="{{n55}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n56" value="{{n56}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n57" value="{{n57}}" max="9" min="1">
			</td>
			<td class="border_right">
				<input type="number" name="n58" value="{{n58}}" max="9" min="1">
			</td>
		</tr>
		<tr>
	    	<td class="border_left">
				<input type="number" name="n60" value="{{n60}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n61" value="{{n61}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n62" value="{{n62}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n63" value="{{n63}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n64" value="{{n64}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n65" value="{{n65}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n66" value="{{n66}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n67" value="{{n67}}" max="9" min="1">
			</td>
			<td class="border_right">
				<input type="number" name="n68" value="{{n68}}" max="9" min="1">
			</td>
		</tr>
		<tr>
	    	<td class="border_left">
				<input type="number" name="n70" value="{{n70}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n71" value="{{n71}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n72" value="{{n72}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n73" value="{{n73}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n74" value="{{n74}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n75" value="{{n75}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n76" value="{{n76}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n77" value="{{n77}}" max="9" min="1">
			</td>
			<td class="border_right">
				<input type="number" name="n78" value="{{n78}}" max="9" min="1">
			</td>
		</tr>
		<tr class="border_bottom">
	    	<td class="border_left">
				<input type="number" name="n80" value="{{n80}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n81" value="{{n81}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n82" value="{{n82}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n83" value="{{n83}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n84" value="{{n84}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n85" value="{{n85}}" max="9" min="1">
			</td>
			<td class="border_left">
				<input type="number" name="n86" value="{{n86}}" max="9" min="1">
			</td>
			<td>
				<input type="number" name="n87" value="{{n87}}" max="9" min="1">
			</td>
			<td class="border_right">
				<input type="number" name="n88" value="{{n88}}" max="9" min="1">
			</td>
		</tr>
	</table>
		<br />
		<br />
		<div>
			<div class="col-xs-12">
				<!--<input type="submit" Value="Submit" formmethod="POST"/>-->
				<button type="submit" class="btn btn-primary">Solve</button>
			</div>
		</div>
	<!--<p>Lets see what we get </p>-->
	</form>
</div>
</body>
</html>