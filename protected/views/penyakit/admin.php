<?php
/* @var $this PenyakitController */
/* @var $model Penyakit */

$this->breadcrumbs=array(
	'Penyakits'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List Penyakit', 'url'=>array('index')),
	array('label'=>'Create Penyakit', 'url'=>array('create')),
);
?>

<h1>Kelola Penyakit</h1>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'penyakit-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'nama',
		'penyebab',
		'gejala',
		'diagnosis',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
