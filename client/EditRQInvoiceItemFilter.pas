
unit EditRQInvoiceItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQInvoiceItemController ;

type
  TfrmRQInvoiceItemFilterEdit = class(TDialogForm)

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
  

  HTTPRIORQInvoiceItem: THTTPRIO;

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
  frmRQInvoiceItemFilterEdit: TfrmRQInvoiceItemFilterEdit;
  RQInvoiceItemFilterObj: RQInvoiceItemFilter;

implementation

uses
  ShowTKMaterials
  ,TKMaterialsController
;

{uses  
    EnergyproController, EnergyproController2, RQInvoiceItemController  ;
}
{$R *.dfm}



procedure TfrmRQInvoiceItemFilterEdit.FormShow(Sender: TObject);

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

    if ( RQInvoiceItemObj.countGen <> nil ) then
       edtCountGen.Text := RQInvoiceItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    edtMaterialNameTxt.Text := RQInvoiceItemObj.materialNameTxt; 



    edtMeasurementNameTxt.Text := RQInvoiceItemObj.measurementNameTxt; 



    if ( RQInvoiceItemObj.countFact <> nil ) then
       edtCountFact.Text := RQInvoiceItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 



    if ( RQInvoiceItemObj.priceWithoutNds <> nil ) then
       edtPriceWithoutNds.Text := RQInvoiceItemObj.priceWithoutNds.decimalString
    else
       edtPriceWithoutNds.Text := ''; 



    if ( RQInvoiceItemObj.nds <> nil ) then
       edtNds.Text := RQInvoiceItemObj.nds.decimalString
    else
       edtNds.Text := ''; 



    if ( RQInvoiceItemObj.sumWithoutNds <> nil ) then
       edtSumWithoutNds.Text := RQInvoiceItemObj.sumWithoutNds.decimalString
    else
       edtSumWithoutNds.Text := ''; 



    if ( RQInvoiceItemObj.sumNds <> nil ) then
       edtSumNds.Text := RQInvoiceItemObj.sumNds.decimalString
    else
       edtSumNds.Text := ''; 



    if ( RQInvoiceItemObj.sumGen <> nil ) then
       edtSumGen.Text := RQInvoiceItemObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



    edtCommentGen.Text := RQInvoiceItemObj.commentGen; 



    edtUserGen.Text := RQInvoiceItemObj.userGen; 



      if RQInvoiceItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQInvoiceItemObj.dateEdit.Year,RQInvoiceItemObj.dateEdit.Month,RQInvoiceItemObj.dateEdit.Day);
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



procedure TfrmRQInvoiceItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQInvoiceItemFilterObj.countGen = nil ) then
       RQInvoiceItemFilterObj.countGen := TXSDecimal.Create;
     RQInvoiceItemFilterObj.countGen.decimalString := edtCountGen.Text ;



     RQInvoiceItemFilterObj.materialNameTxt := edtMaterialNameTxt.Text; 



     RQInvoiceItemFilterObj.measurementNameTxt := edtMeasurementNameTxt.Text; 



     if (RQInvoiceItemFilterObj.countFact = nil ) then
       RQInvoiceItemFilterObj.countFact := TXSDecimal.Create;
     RQInvoiceItemFilterObj.countFact.decimalString := edtCountFact.Text ;



     if (RQInvoiceItemFilterObj.priceWithoutNds = nil ) then
       RQInvoiceItemFilterObj.priceWithoutNds := TXSDecimal.Create;
     RQInvoiceItemFilterObj.priceWithoutNds.decimalString := edtPriceWithoutNds.Text ;



     if (RQInvoiceItemFilterObj.nds = nil ) then
       RQInvoiceItemFilterObj.nds := TXSDecimal.Create;
     RQInvoiceItemFilterObj.nds.decimalString := edtNds.Text ;



     if (RQInvoiceItemFilterObj.sumWithoutNds = nil ) then
       RQInvoiceItemFilterObj.sumWithoutNds := TXSDecimal.Create;
     RQInvoiceItemFilterObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text ;



     if (RQInvoiceItemFilterObj.sumNds = nil ) then
       RQInvoiceItemFilterObj.sumNds := TXSDecimal.Create;
     RQInvoiceItemFilterObj.sumNds.decimalString := edtSumNds.Text ;



     if (RQInvoiceItemFilterObj.sumGen = nil ) then
       RQInvoiceItemFilterObj.sumGen := TXSDecimal.Create;
     RQInvoiceItemFilterObj.sumGen.decimalString := edtSumGen.Text ;



     RQInvoiceItemFilterObj.commentGen := edtCommentGen.Text; 



     RQInvoiceItemFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQInvoiceItemFilterObj.dateEdit = nil then
          RQInvoiceItemFilterObj.dateEdit := TXSDate.Create;
       RQInvoiceItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQInvoiceItemFilterObj.dateEdit := nil;





  end;
end;

procedure TfrmRQInvoiceItemFilterEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQInvoiceItemFilterObj.material = nil then RQInvoiceItemFilterObj.material := TKMaterials.Create();
               //RQInvoiceItemFilterObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
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