
unit EditRQBillItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQBillItemController ;

type
  TfrmRQBillItemFilterEdit = class(TDialogForm)

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
  

  HTTPRIORQBillItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKMaterialsMaterialClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQBillItemFilterEdit: TfrmRQBillItemFilterEdit;
  RQBillItemFilterObj: RQBillItemFilter;

implementation

uses
  ShowTKMaterials
  ,TKMaterialsController
;

{uses  
    EnergyproController, EnergyproController2, RQBillItemController  ;
}
{$R *.dfm}



procedure TfrmRQBillItemFilterEdit.FormShow(Sender: TObject);

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

    if ( RQBillItemObj.countGen <> nil ) then
       edtCountGen.Text := RQBillItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    edtMaterialNameTxt.Text := RQBillItemObj.materialNameTxt; 



    edtMeasurementNameTxt.Text := RQBillItemObj.measurementNameTxt; 



    if ( RQBillItemObj.countFact <> nil ) then
       edtCountFact.Text := RQBillItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 



    if ( RQBillItemObj.priceWithoutNds <> nil ) then
       edtPriceWithoutNds.Text := RQBillItemObj.priceWithoutNds.decimalString
    else
       edtPriceWithoutNds.Text := ''; 



    if ( RQBillItemObj.nds <> nil ) then
       edtNds.Text := RQBillItemObj.nds.decimalString
    else
       edtNds.Text := ''; 



    if ( RQBillItemObj.sumWithoutNds <> nil ) then
       edtSumWithoutNds.Text := RQBillItemObj.sumWithoutNds.decimalString
    else
       edtSumWithoutNds.Text := ''; 



    if ( RQBillItemObj.sumNds <> nil ) then
       edtSumNds.Text := RQBillItemObj.sumNds.decimalString
    else
       edtSumNds.Text := ''; 



    if ( RQBillItemObj.sumGen <> nil ) then
       edtSumGen.Text := RQBillItemObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



    edtCommentGen.Text := RQBillItemObj.commentGen; 



    edtUserGen.Text := RQBillItemObj.userGen; 



      if RQBillItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQBillItemObj.dateEdit.Year,RQBillItemObj.dateEdit.Month,RQBillItemObj.dateEdit.Day);
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



procedure TfrmRQBillItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQBillItem: RQBillItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQBillItemFilterObj.countGen = nil ) then
       RQBillItemFilterObj.countGen := TXSDecimal.Create;
     RQBillItemFilterObj.countGen.decimalString := edtCountGen.Text ;



     RQBillItemFilterObj.materialNameTxt := edtMaterialNameTxt.Text; 



     RQBillItemFilterObj.measurementNameTxt := edtMeasurementNameTxt.Text; 



     if (RQBillItemFilterObj.countFact = nil ) then
       RQBillItemFilterObj.countFact := TXSDecimal.Create;
     RQBillItemFilterObj.countFact.decimalString := edtCountFact.Text ;



     if (RQBillItemFilterObj.priceWithoutNds = nil ) then
       RQBillItemFilterObj.priceWithoutNds := TXSDecimal.Create;
     RQBillItemFilterObj.priceWithoutNds.decimalString := edtPriceWithoutNds.Text ;



     if (RQBillItemFilterObj.nds = nil ) then
       RQBillItemFilterObj.nds := TXSDecimal.Create;
     RQBillItemFilterObj.nds.decimalString := edtNds.Text ;



     if (RQBillItemFilterObj.sumWithoutNds = nil ) then
       RQBillItemFilterObj.sumWithoutNds := TXSDecimal.Create;
     RQBillItemFilterObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text ;



     if (RQBillItemFilterObj.sumNds = nil ) then
       RQBillItemFilterObj.sumNds := TXSDecimal.Create;
     RQBillItemFilterObj.sumNds.decimalString := edtSumNds.Text ;



     if (RQBillItemFilterObj.sumGen = nil ) then
       RQBillItemFilterObj.sumGen := TXSDecimal.Create;
     RQBillItemFilterObj.sumGen.decimalString := edtSumGen.Text ;



     RQBillItemFilterObj.commentGen := edtCommentGen.Text; 



     RQBillItemFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQBillItemFilterObj.dateEdit = nil then
          RQBillItemFilterObj.dateEdit := TXSDate.Create;
       RQBillItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQBillItemFilterObj.dateEdit := nil;





  end;
end;

procedure TfrmRQBillItemFilterEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQBillItemFilterObj.material = nil then RQBillItemFilterObj.material := TKMaterials.Create();
               //RQBillItemFilterObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
               //edtTKMaterialsMaterialName.Text:=GetReturnValue(sgTKMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMaterialsShow.Free;
   end;
end;





end.