
unit EditRQTransportInvoiceItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQTransportInvoiceItemController;

type
  TfrmRQTransportInvoiceItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblMaterialName : TLabel;
    edtMaterialName: TEdit;
    lblMeasurementName : TLabel;
    edtMeasurementName: TEdit;
    lblCountFact : TLabel;
    edtCountFact: TEdit;
    lblWeight : TLabel;
    edtWeight: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQTransportInvoiceItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    btnMaterial: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure btnMaterialClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    RQTransportInvoiceCode : Integer;

end;

var
  frmRQTransportInvoiceItemEdit: TfrmRQTransportInvoiceItemEdit;
  RQTransportInvoiceItemObj: RQTransportInvoiceItem;

implementation


uses
ShowTKMaterials, TKMaterialsController;

{$R *.dfm}



procedure TfrmRQTransportInvoiceItemEdit.FormShow(Sender: TObject);

begin

 SetFloatStyle([edtCountFact]);

 DisableControls([edtCode, edtMaterialName, btnMaterial, edtMeasurementName, edtCountFact,
                  edtWeight, edtCommentGen, edtUserGen, edtDateEdit], True);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountFact]);
     DisableControls([edtCountFact, btnMaterial], False);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      edtCode.Text := IntToStr(RQTransportInvoiceItemObj.code);
    edtMaterialName.Text := RQTransportInvoiceItemObj.materialName;
    edtMeasurementName.Text := RQTransportInvoiceItemObj.measurementName; 
    if ( RQTransportInvoiceItemObj.countFact <> nil ) then
       edtCountFact.Text := RQTransportInvoiceItemObj.countFact.decimalString
    else
       edtCountFact.Text := ''; 
    if ( RQTransportInvoiceItemObj.weight <> nil ) then
       edtWeight.Text := RQTransportInvoiceItemObj.weight.decimalString
    else
       edtWeight.Text := ''; 
    edtCommentGen.Text := RQTransportInvoiceItemObj.commentGen; 
    edtUserGen.Text := RQTransportInvoiceItemObj.userGen; 
      if RQTransportInvoiceItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQTransportInvoiceItemObj.dateEdit.Year,RQTransportInvoiceItemObj.dateEdit.Month,RQTransportInvoiceItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;
end;



procedure TfrmRQTransportInvoiceItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountFact
     ])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQTransportInvoiceItem := HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;

//    RQTransport
//    RQTransportInvoiceItemObj.transportInvoiceRef.code :=  RQTransportInvoiceCode;

     RQTransportInvoiceItemObj.materialName := edtMaterialName.Text;

     RQTransportInvoiceItemObj.measurementName := edtMeasurementName.Text; 

     if (RQTransportInvoiceItemObj.countFact = nil ) then
       RQTransportInvoiceItemObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       RQTransportInvoiceItemObj.countFact.decimalString := edtCountFact.Text
     else
       RQTransportInvoiceItemObj.countFact := nil;

     if (RQTransportInvoiceItemObj.weight = nil ) then
       RQTransportInvoiceItemObj.weight := TXSDecimal.Create;
     if edtWeight.Text <> '' then
       RQTransportInvoiceItemObj.weight.decimalString := edtWeight.Text 
     else
       RQTransportInvoiceItemObj.weight := nil;

     RQTransportInvoiceItemObj.commentGen := edtCommentGen.Text; 

     RQTransportInvoiceItemObj.userGen := edtUserGen.Text;

     if edtdateEdit.checked then
     begin 
       if RQTransportInvoiceItemObj.dateEdit = nil then
          RQTransportInvoiceItemObj.dateEdit := TXSDate.Create;
       RQTransportInvoiceItemObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQTransportInvoiceItemObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      RQTransportInvoiceItemObj.code:=low(Integer);
      TempRQTransportInvoiceItem.add(RQTransportInvoiceItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQTransportInvoiceItem.save(RQTransportInvoiceItemObj);
    end;
  end;
end;


procedure TfrmRQTransportInvoiceItemEdit.btnMaterialClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
begin
    frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);

  try
    with frmSpr_matherialShow do
    begin
      // NET-73 «акрываем любое редактирование материалов (оставл€ем только просмотр)
      // (дл€ редактировани€ есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);

      DenyGroupSelection := true;

      if ShowModal = mrOk then
    
        try
         begin
            if RQTransportInvoiceItemObj.materialRef = nil then RQTransportInvoiceItemObj.materialRef := TKMaterialsRef.Create;
            RQTransportInvoiceItemObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
            edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ;
            edtMeasurementName.Text :=  TKMaterialsShort(tvDep.Selected.Data).measurementName;
         end;
         except
          on EConvertError do Exit;

        end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;

end;



end.