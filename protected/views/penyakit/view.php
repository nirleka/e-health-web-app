<?php
/* @var $this PenyakitController */
/* @var $model Penyakit */

$this->breadcrumbs=array(
	'Penyakits'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Penyakit', 'url'=>array('index')),
	array('label'=>'Create Penyakit', 'url'=>array('create')),
	array('label'=>'Update Penyakit', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Penyakit', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Penyakit', 'url'=>array('admin')),
);
?>

<h1>View Penyakit #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'nama',
		'penyebab',
		'gejala',
		'diagnosis',
		'knowledge',
		array(
            'label'=>'Daftar Obat',
            'type'=>'raw',
            'value'=>$model->obatName,
        ),
	),
)); ?>
