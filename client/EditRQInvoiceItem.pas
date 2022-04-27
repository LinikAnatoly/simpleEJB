
unit EditRQInvoiceItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQInvoiceItemController ;

type
  TfrmRQInvoiceItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblMaterialNameTxt : TLabel;
    edtMaterialNameTxt: TEdit;
    lblMeasurementNameTxt : TLabel;
    edtMeasurementNameTxt: TEdit;
    lblCountFact : TLabel;
    edtCountFact: TEdit;
    lblSumNds : TLabel;
    lblSumGen : TLabel;
    edtSumGen: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    edtPriceWithNds: TEdit;

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
  frmRQInvoiceItemEdit: TfrmRQInvoiceItemEdit;
  RQInvoiceItemObj: RQInvoiceItem;

implementation

uses
  ShowTKMaterials
  ,TKMaterialsController
;

{uses  
    EnergyproController, EnergyproController2, RQInvoiceItemController  ;
}
{$R *.dfm}



procedure TfrmRQInvoiceItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtTKMaterialsMaterialName
      ,spbTKMaterialsMaterial
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
       edtPriceWithNds
      ,edtSumGen
      ,edtCountFact
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQInvoiceItemObj.code);
    edtMaterialNameTxt.Text := RQInvoiceItemObj.materialNameTxt;
    edtMeasurementNameTxt.Text := RQInvoiceItemObj.measurementNameTxt;
    if ( RQInvoiceItemObj.countFact <> nil ) then
       edtCountFact.Text := RQInvoiceItemObj.countFact.decimalString
    else
       edtCountFact.Text := '';
    if ( RQInvoiceItemObj.sumGen <> nil ) then
       edtSumGen.Text := RQInvoiceItemObj.sumGen.decimalString
    else
       edtSumGen.Text := '';

    if ( RQInvoiceItemObj.priceWithNds <> nil ) then
       edtPriceWithNds.Text := RQInvoiceItemObj.priceWithNds.decimalString
    else
       edtPriceWithNds.Text := '';

    edtCommentGen.Text := RQInvoiceItemObj.commentGen;
    edtTKMaterialsMaterialName.Text := RQInvoiceItemObj.material.name;

  end;
end;



procedure TfrmRQInvoiceItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountFact
      ,edtPriceWithNds
      ,edtSumGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQInvoiceItem := HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;


     if (RQInvoiceItemObj.countGen = nil ) then
       RQInvoiceItemObj.countGen := TXSDecimal.Create;

     RQInvoiceItemObj.materialNameTxt := edtMaterialNameTxt.Text;
     RQInvoiceItemObj.measurementNameTxt := edtMeasurementNameTxt.Text;

     if (RQInvoiceItemObj.countFact = nil ) then
       RQInvoiceItemObj.countFact := TXSDecimal.Create;

     if edtCountFact.Text <> '' then
       RQInvoiceItemObj.countFact.decimalString := edtCountFact.Text
     else
       RQInvoiceItemObj.countFact := nil;

     if (RQInvoiceItemObj.priceWithNds = nil ) then
       RQInvoiceItemObj.priceWithNds := TXSDecimal.Create; 
     if edtPriceWithNds.Text <> '' then
       RQInvoiceItemObj.priceWithNds.decimalString := edtPriceWithNds.Text
     else
       RQInvoiceItemObj.priceWithNds := nil;

     if (RQInvoiceItemObj.sumGen = nil ) then
       RQInvoiceItemObj.sumGen := TXSDecimal.Create;

     if edtSumGen.Text <> '' then
       RQInvoiceItemObj.sumGen.decimalString := edtSumGen.Text
     else
       RQInvoiceItemObj.sumGen := nil;

     RQInvoiceItemObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      RQInvoiceItemObj.code:=low(Integer);
      TempRQInvoiceItem.add(RQInvoiceItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQInvoiceItem.save(RQInvoiceItemObj);
    end;
  end;
end;


procedure TfrmRQInvoiceItemEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQInvoiceItemObj.material = nil then RQInvoiceItemObj.material := TKMaterials.Create();
               //RQInvoiceItemObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
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