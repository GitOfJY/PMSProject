<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
table {
	border: 1px solid #E0E0E0;
	margin-left: auto;
	margin-right: auto;
	table-layout: fixed;
	box-shadow: 0px 0px 13px 0px rgb(82 63 105/ 5%);
}

.multi-portlet {
	background: #ffffff;
	padding: 20px;
	margin-bottom: 15px;
	margin-left: 20px;
	margin-right: 20px;
	height: 1100px;
	box-shadow: 0px 0px 13px 0px rgb(82 63 105/ 5%);
	text-decoration-line: none;
	text-color: #EDF6F9;
}

th {
	border: 1px solid #E0E0E0;
	text-align: center;
	background-color: #FAFAFA;
	height: 50px;
}

.col {text-align = center;
	
}

.list {
	padding-top: 20px;
	padding-bottom: 20px;
	margin-bottom: 10px;
	border-radius: 8px;
	margin-right: 0px;
	margin-left: 0px;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'gantt' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Task ID');
		data.addColumn('string', 'Task Name');
		data.addColumn('string', 'Resource');
		data.addColumn('date', 'Start Date');
		data.addColumn('date', 'End Date');
		data.addColumn('number', 'Duration');
		data.addColumn('number', 'Percent Complete');
		data.addColumn('string', 'Dependencies');

		data.addRows([
				[ '1', '웹 개발 기획 _ 1', '1. 웹 개발 기획', new Date(2021, 0, 15),
						new Date(2021, 3, 14), null, 100, null ],

				[ '1.1', '서비스 차이점 및 기획 확인 _ 1.1', '1.1 서비스 차이점 및 기획 확인',
						new Date(2021, 0, 15), new Date(2021, 0, 27), null,
						100, null ],

				[ '1.2', 'SWOT 분석 _ 1.2', '1.2 SWOT 분석', new Date(2021, 0, 28),
						new Date(2021, 2, 22), null, 100, null ],

				[ '1.3', '사업 모델 검토 _ 1.3', '1.3 사업 모델 검토',
						new Date(2021, 2, 23), new Date(2021, 3, 8), null, 100,
						null ],

				[ '1.4', '사업 전략 전망 검토 _ 1.4', '1.4 사업 전략 전망 검토',
						new Date(2021, 3, 9), new Date(2021, 3, 14), null, 100,
						null ],

				[ '2', '요구분석 및 타당성 검토 _ 2', '2. 요구분석 및 타당성 검토',
						new Date(2021, 3, 15), new Date(2021, 6, 14), null,
						100, null ],

				[ '2.1', '요구분석 회의 _ 2.1', '2.1 요구분석 회의', new Date(2021, 3, 15),
						new Date(2021, 4, 13), null, 100, null ],

				[ '2.2', '고객 데이터 및 의견 검토 _ 2.2', '2.2 고객 데이터 및 의견 검토',
						new Date(2021, 4, 14), new Date(2021, 4, 27), null,
						100, null ],

				[ '2.3', '회사 팀 및 채널 검토 _ 2.3', '2.3 회사 팀 및 채널 검토',
						new Date(2021, 5, 1), new Date(2021, 5, 22), null, 100,
						null ],

				[ '2.4', '추가 작업 테스트 _ 2.4', '2.4 추가 작업 테스트',
						new Date(2021, 5, 27), new Date(2021, 6, 14), null,
						100, null ],

				[ '3', '개발 및 검증 _ 3', '3. 개발 및 검증', new Date(2021, 6, 15),
						new Date(2021, 9, 14), null, 100, null ],

				[ '3.1', 'main 개발 후 테스트 _ 3.1', '3.1 main 개발 후 테스트',
						new Date(2021, 6, 15), new Date(2021, 6, 27), null,
						100, null ],

				[ '3.2', 'a업무 개발 후 테스트 _ 3.2', '3.2 a업무 개발 후 테스트',
						new Date(2021, 7, 1), new Date(2021, 7, 15), null, 100,
						null ],

				[ '3.3', 'b업무 개발 후 테스트 _ 3.3', '3.3 b업무 개발 후 테스트',
						new Date(2021, 7, 16), new Date(2021, 8, 11), null,
						100, null ],

				[ '3.4', '통합 후 테스트 _ 3.4', '3.4 통합 후 테스트',
						new Date(2021, 8, 15), new Date(2021, 9, 14), null,
						100, null ], 
			]);

		var options = {
			height : 800,
			gantt : {
				trackHeight : 50
			}
		};

		var chart = new google.visualization.Gantt(document
				.getElementById('chart_div'));

		chart.draw(data, options);
	}
</script>