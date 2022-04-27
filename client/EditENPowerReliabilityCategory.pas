
unit EditENPowerReliabilityCategory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENPowerReliabilityCategoryController ;

type
  TfrmENPowerReliabilityCategoryEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;

  lblENSettleTypeSettleTypeRefName : TLabel;
  edtENSettleTypeSettleTypeRefName : TEdit;
  spbENSettleTypeSettleTypeRef : TSpeedButton;
  

  HTTPRIOENPowerReliabilityCategory: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblCoef: TLabel;
    edtCoef: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENSettleTypeSettleTypeRefClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPowerReliabilityCategoryEdit: TfrmENPowerReliabilityCategoryEdit;
  ENPowerReliabilityCategoryObj: ENPowerReliabilityCategory;

implementation

uses
  ShowENSettleType
  ,ENSettleTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENPowerReliabilityCategoryController  ;
}
{$R *.dfm}



procedure TfrmENPowerReliabilityCategoryEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
    DisableControls([edtENSettleTypeSettleTypeRefName, spbENSettleTypeSettleTypeRef]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtENSettleTypeSettleTypeRefName]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENPowerReliabilityCategoryObj.code);
    edtName.Text := ENPowerReliabilityCategoryObj.name;

    if ( ENPowerReliabilityCategoryObj.coef <> nil ) then
       edtCoef.Text := ENPowerReliabilityCategoryObj.coef.decimalString
    else
       edtCoef.Text := '';
    //edtENSettleTypeSettleTypeRefName.Text := ENPowerReliabilityCategoryObj.settleTypeRef.name;

  end;
end;



procedure TfrmENPowerReliabilityCategoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPowerReliabilityCategory: ENPowerReliabilityCategoryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName, edtCoef
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPowerReliabilityCategory := HTTPRIOENPowerReliabilityCategory as ENPowerReliabilityCategoryControllerSoapPort;


     ENPowerReliabilityCategoryObj.name := edtName.Text;

     if (ENPowerReliabilityCategoryObj.coef = nil ) then
       ENPowerReliabilityCategoryObj.coef := TXSDecimal.Create;
     if edtCoef.Text <> '' then
       ENPowerReliabilityCategoryObj.coef.decimalString := edtCoef.Text
     else
       ENPowerReliabilityCategoryObj.coef := nil;


    if DialogState = dsInsert then
    begin
      ENPowerReliabilityCategoryObj.code:=low(Integer);
      TempENPowerReliabilityCategory.add(ENPowerReliabilityCategoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPowerReliabilityCategory.save(ENPowerReliabilityCategoryObj);
    end;
  end;
end;


procedure TfrmENPowerReliabilityCategoryEdit.spbENSettleTypeSettleTypeRefClick(Sender : TObject);
var 
   frmENSettleTypeShow: TfrmENSettleTypeShow;
begin
   frmENSettleTypeShow:=TfrmENSettleTypeShow.Create(Application,fmNormal);
   try
      with frmENSettleTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPowerReliabilityCategoryObj.settleTypeRef = nil then ENPowerReliabilityCategoryObj.settleTypeRef := ENSettleTypeRef.Create();
               ENPowerReliabilityCategoryObj.settleTypeRef.code := StrToInt(GetReturnValue(sgENSettleType,0));
               edtENSettleTypeSettleTypeRefName.Text:=GetReturnValue(sgENSettleType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSettleTypeShow.Free;
   end;
end;



end.