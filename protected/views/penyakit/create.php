<?php
/* @var $this PenyakitController */
/* @var $model Penyakit */

$this->breadcrumbs=array(
	'Penyakits'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Penyakit', 'url'=>array('index')),
	array('label'=>'Manage Penyakit', 'url'=>array('admin')),
);
?>

<h1>Create Penyakit</h1>

<?php $this->renderPartial('_form', array('model'=>$model, 'listObat' => $listObat)); ?>