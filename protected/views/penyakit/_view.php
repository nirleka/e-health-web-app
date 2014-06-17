<?php
/* @var $this PenyakitController */
/* @var $data Penyakit */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nama')); ?>:</b>
	<?php echo CHtml::encode($data->nama); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('penyebab')); ?>:</b>
	<?php echo CHtml::encode($data->penyebab); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('gejala')); ?>:</b>
	<?php echo CHtml::encode($data->gejala); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('diagnosis')); ?>:</b>
	<?php echo CHtml::encode($data->diagnosis); ?>
	<br />


</div>