import ttytm.webview

const html = "<!DOCTYPE html>
<html lang='en'>
	<head>
		<style>
			body {
				background: linear-gradient(to right, #274060, #1B2845);
				color: GhostWhite;
				font-family: sans-serif;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<h1>Your App Content!</h1>
		<button onclick='callV()'>Call V!</button>
		<select id='dropdown1'>
			<option value='option1'>Option 1</option>
			<option value='option2'>Option 2</option>
			<option value='option3'>Option 3</option>
		</select>

		<select id='dropdown2'>
			<option value='option1'>Option 1</option>
			<option value='option2'>Option 2</option>
			<option value='option3'>Option 3</option>
		</select>

		<select id='dropdown3'>
			<option value='option1'>Option 1</option>
			<option value='option2'>Option 2</option>
			<option value='option3'>Option 3</option>
		</select>
	</body>
	<script>
		async function callV() {
			// Get the selected values from the dropdowns
			const dropdown1 = document.getElementById('dropdown1');
			const dropdown2 = document.getElementById('dropdown2');
			const dropdown3 = document.getElementById('dropdown3');
			const selectedValue1 = dropdown1.value;
			const selectedValue2 = dropdown2.value;
			const selectedValue3 = dropdown3.value;

			// Call a V function that takes the selected values as arguments and returns a value.
			const res = await window.my_v_func(selectedValue1, selectedValue2, selectedValue3);
			console.log(res);
		}
	</script>
</html>
</html>"

fn my_v_func(e &webview.Event) string {
	println("//
	function checkAllBannersExcept(region, houseNumbers, phases) {
		var rows = document.querySelectorAll('tbody tr');

		rows.forEach(row => {
			var regionCell = row.querySelector('td:first-child');
			var houseNumberCell = row.querySelector('td.left strong');
			
			if (regionCell && regionCell.innerText.includes(region)) {
				houseNumbers.forEach((houseNumber, index) => {
					var phase = phases[index];
					var phaseCell = row.querySelector(`td[data-name='\${phase} :']`);

					if (houseNumberCell && houseNumberCell.innerText.includes(houseNumber)) {
						var checkbox = phaseCell ? phaseCell.querySelector('input[type=\'checkbox\']') : null;
						if (checkbox && !checkbox.classList.contains('chk_dis')) {
							checkbox.checked = false;
						}
				}
				});
			}
		});
		document.querySelectorAll('input[type=\'checkbox\']:not(.chk_dis)').forEach(checkbox => {
			if (!checkbox.checked) {
				checkbox.checked = true;
			}
		});
	}

	var region = '대덕구';
	var houseNumbers = ['501', '502-1', '506'];
	var phases = ['3차', '4차', '1차'];

	checkAllBannersExcept(region, houseNumbers, phases);")

	e.eval("console.log('Hello from V from JS!');")
	str_arg := e.get_arg[string](0) or { '' } // Get string arg at index `0`
	return str_arg + ' Hello back from V!'
}

fn main(){
	w := webview.create(debug: true)
	w.bind('my_v_func', my_v_func)
	w.set_size(600, 400, .@none)
	w.set_html(html)
	w.run()
}