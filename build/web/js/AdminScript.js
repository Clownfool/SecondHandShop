document.addEventListener("DOMContentLoaded", function() {
  // Lấy chiều cao của header và truyền vào CSS
  // const headerHeight = document.querySelector('.header').offsetHeight;
  // document.querySelector('.body-section').style.height = `calc(100% - ${headerHeight}px)`;
});

const headerHeight = document.querySelector('.header').offsetHeight;
document.querySelector('.body-section').style.marginTop = `${headerHeight}px`;


let ctx = document.getElementById("myChart").getContext("2d");
	let myChart = new Chart(ctx, {
		type: "line",
		data: {
			labels: [
				"Jan",
				"March",
				"May",
				"July",
				"Sep",
				"Nov",
			],
			datasets: [
				{
					label: "Number of products",
					data: [2, 9, 3, 17, 6, 3],
					backgroundColor: "rgb(255,199,199,0.3)",
				},
				{
					label: "Number of transaction",
					data: [2, 2, 5, 5, 2, 1],
					backgroundColor: "rgb(191,192,238,0.3)",
				},
			],
		},
	});



