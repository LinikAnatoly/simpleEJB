
unit EditRQOrderItemFilterOld;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderItemController ;

type
  TfrmRQOrderItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblMaterialNameTxt : TLabel;
    edtMaterialNameTxt: TEdit;
    lblMeasurementNameTxt : TLabel;
    edtMeasurementNameTxt: TEdit;
    lblCountFact : TLabel;
    edtCountFact: TEdit;
    lblPriceWithoutNds : TLabel;
    edtPriceWithoutNds: TEdit;
    lblNds : TLabel;
    edtNds: TEdit;
    lblSumWithoutNds : TLabel;
    edtSumWithoutNds: TEdit;
    lblSumNds : TLabel;
    edtSumNds: TEdit;
    lblSumGen : TLabel;
    edtSumGen: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblTKMaterialsMaterialName : TLabel;
  edtTKMaterialsMaterialName : TEdit;
  spbTKMaterialsMaterial : TSpeedButton;
  
  lblTKMeasurementMeasurementName : TLabel;
  edtTKMeasurementMeasurementName : TEdit;
  spbTKMeasurementMeasurement : TSpeedButton;
  
  lblRQOrgOrgName : TLabel;
  edtRQOrgOrgName : TEdit;
  spbRQOrgOrg : TSpeedButton;
  
  lblRQDDSCodesDdsCodesName : TLabel;
  edtRQDDSCodesDdsCodesName : TEdit;
  spbRQDDSCodesDdsCodes : TSpeedButton;
  

  HTTPRIORQOrderItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKMaterialsMaterialClick(Sender : TObject);
  procedure spbTKMeasurementMeasurementClick(Sender : TObject);
  procedure spbRQOrgOrgClick(Sender : TObject);
  procedure spbRQDDSCodesDdsCodesClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQOrderItemFilterEdit: TfrmRQOrderItemFilterEdit;
  RQOrderItemFilterObj: RQOrderItemFilter;

implementation

uses
  ShowTKMaterials
  ,TKMaterialsController
  ,ShowTKMeasurement
  ,TKMeasurementController
  ,ShowRQOrg
  ,RQOrgController
  ,ShowRQDDSCodes
  ,RQDDSCodesController
;

{uses  
    EnergyproController, EnergyproController2, RQOrderItemController  ;
}
{$R *.dfm}



procedure TfrmRQOrderItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtCountFact
      ,edtPriceWithoutNds
      ,edtNds
      ,edtSumWithoutNds
      ,edtSumNds
      ,edtSumGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQOrderItemObj.countGen <> nil ) then
       edtCountGen.Text := RQOrderItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    edtMaterialNameTxt.Text := RQOrderItemObj.materialNameTxt; 



    edtMeasurementNameTxt.Text := RQOrderItemObj.measurementNameTxt; 



    if ( RQOrderItemObj.countFact <> nil ) then
       edtCountFact.Text := RQOrderItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 



    if ( RQOrderItemObj.priceWithoutNds <> nil ) then
       edtPriceWithoutNds.Text := RQOrderItemObj.priceWithoutNds.decimalString
    else
       edtPriceWithoutNds.Text := ''; 



    if ( RQOrderItemObj.nds <> nil ) then
       edtNds.Text := RQOrderItemObj.nds.decimalString
    else
       edtNds.Text := ''; 



    if ( RQOrderItemObj.sumWithoutNds <> nil ) then
       edtSumWithoutNds.Text := RQOrderItemObj.sumWithoutNds.decimalString
    else
       edtSumWithoutNds.Text := ''; 



    if ( RQOrderItemObj.sumNds <> nil ) then
       edtSumNds.Text := RQOrderItemObj.sumNds.decimalString
    else
       edtSumNds.Text := ''; 



    if ( RQOrderItemObj.sumGen <> nil ) then
       edtSumGen.Text := RQOrderItemObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



    edtCommentGen.Text := RQOrderItemObj.commentGen; 



    edtUserGen.Text := RQOrderItemObj.userGen; 



      if RQOrderItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQOrderItemObj.dateEdit.Year,RQOrderItemObj.dateEdit.Month,RQOrderItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

end;



procedure TfrmRQOrderItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderItem: RQOrderItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQOrderItemFilterObj.countGen = nil ) then
       RQOrderItemFilterObj.countGen := TXSDecimal.Create;
     RQOrderItemFilterObj.countGen.decimalString := edtCountGen.Text ;



     RQOrderItemFilterObj.materialNameTxt := edtMaterialNameTxt.Text; 



     RQOrderItemFilterObj.measurementNameTxt := edtMeasurementNameTxt.Text; 



     if (RQOrderItemFilterObj.countFact = nil ) then
       RQOrderItemFilterObj.countFact := TXSDecimal.Create;
     RQOrderItemFilterObj.countFact.decimalString := edtCountFact.Text ;



     if (RQOrderItemFilterObj.priceWithoutNds = nil ) then
       RQOrderItemFilterObj.priceWithoutNds := TXSDecimal.Create;
     RQOrderItemFilterObj.priceWithoutNds.decimalString := edtPriceWithoutNds.Text ;



     if (RQOrderItemFilterObj.nds = nil ) then
       RQOrderItemFilterObj.nds := TXSDecimal.Create;
     RQOrderItemFilterObj.nds.decimalString := edtNds.Text ;



     if (RQOrderItemFilterObj.sumWithoutNds = nil ) then
       RQOrderItemFilterObj.sumWithoutNds := TXSDecimal.Create;
     RQOrderItemFilterObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text ;



     if (RQOrderItemFilterObj.sumNds = nil ) then
       RQOrderItemFilterObj.sumNds := TXSDecimal.Create;
     RQOrderItemFilterObj.sumNds.decimalString := edtSumNds.Text ;



     if (RQOrderItemFilterObj.sumGen = nil ) then
       RQOrderItemFilterObj.sumGen := TXSDecimal.Create;
     RQOrderItemFilterObj.sumGen.decimalString := edtSumGen.Text ;



     RQOrderItemFilterObj.commentGen := edtCommentGen.Text; 



     RQOrderItemFilterObj.userGen := edtUserGen.Text; 



     if RQOrderItemFilterObj.dateEdit = nil then
        RQOrderItemFilterObj.dateEdit := TXSDate.Create;
      RQOrderItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));





  end;
end;

procedure TfrmRQOrderItemFilterEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItemFilterObj.material = nil then RQOrderItemFilterObj.material := TKMaterials.Create();
               //RQOrderItemFilterObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
               //edtTKMaterialsMaterialName.Text:=GetReturnValue(sgTKMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMaterialsShow.Free;
   end;
end;


procedure TfrmRQOrderItemFilterEdit.spbTKMeasurementMeasurementClick(Sender : TObject);
var 
   frmTKMeasurementShow: TfrmTKMeasurementShow;
begin
   frmTKMeasurementShow:=TfrmTKMeasurementShow.Create(Application,fmNormal);
   try
      with frmTKMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItemFilterObj.measurement = nil then RQOrderItemFilterObj.measurement := TKMeasurement.Create();
               RQOrderItemFilterObj.measurement.code := StrToInt(GetReturnValue(sgTKMeasurement,0));
               edtTKMeasurementMeasurementName.Text:=GetReturnValue(sgTKMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMeasurementShow.Free;
   end;
end;


procedure TfrmRQOrderItemFilterEdit.spbRQOrgOrgClick(Sender : TObject);
var 
   frmRQOrgShow: TfrmRQOrgShow;
begin
   frmRQOrgShow:=TfrmRQOrgShow.Create(Application,fmNormal);
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItemFilterObj.org = nil then RQOrderItemFilterObj.org := RQOrg.Create();
               RQOrderItemFilterObj.org.code := StrToInt(GetReturnValue(sgRQOrg,0));
               edtRQOrgOrgName.Text:=GetReturnValue(sgRQOrg,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
end;


procedure TfrmRQOrderItemFilterEdit.spbRQDDSCodesDdsCodesClick(Sender : TObject);
var 
   frmRQDDSCodesShow: TfrmRQDDSCodesShow;
begin
   frmRQDDSCodesShow:=TfrmRQDDSCodesShow.Create(Application,fmNormal);
   try
      with frmRQDDSCodesShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItemFilterObj.ddsCodes = nil then RQOrderItemFilterObj.ddsCodes := RQDDSCodes.Create();
               RQOrderItemFilterObj.ddsCodes.code := StrToInt(GetReturnValue(sgRQDDSCodes,0));
               edtRQDDSCodesDdsCodesName.Text:=GetReturnValue(sgRQDDSCodes,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQDDSCodesShow.Free;
   end;
end;





end.