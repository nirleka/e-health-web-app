<?php
/* @var $this PenyakitController */
/* @var $model Penyakit */

$this->breadcrumbs=array(
	'Penyakits'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Penyakit', 'url'=>array('index')),
	array('label'=>'Create Penyakit', 'url'=>array('create')),
	array('label'=>'View Penyakit', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Penyakit', 'url'=>array('admin')),
);
?>

<h1>Update Penyakit <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>