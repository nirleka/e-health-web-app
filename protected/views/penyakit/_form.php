<?php
/* @var $this PenyakitController */
/* @var $model Penyakit */
/* @var $form CActiveForm */
$this->widget(
  	'application.widget.emultiselect.EMultiSelect',
  	array('sortable'=>true, 'searchable'=>true)
);
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'penyakit-form',
	'enableAjaxValidation' => true,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nama'); ?>
		<?php echo $form->textField($model,'nama',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'nama'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'penyebab'); ?>
		<?php echo $form->textArea($model,'penyebab',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'penyebab'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'gejala'); ?>
		<?php echo $form->textArea($model,'gejala',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'gejala'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'diagnosis'); ?>
		<?php echo $form->textArea($model,'diagnosis',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'diagnosis'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'knowledge'); ?>
		<?php echo $form->textArea($model,'knowledge',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'knowledge'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'obatsIDs'); ?>
		<?php if (empty($listObat)): ?>
			<h4>Daftar Obat Belum dibuat</h4>
		<?php else: ?>
			<?php echo $form->dropDownList($model, 'obatsIDs', $listObat, array('multiple' => 'multiple', 'key'=>'obatsIDs', 'class' => 'multiselect')); ?>
		<?php endif; ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->