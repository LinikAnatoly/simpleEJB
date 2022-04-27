
unit EditSCUsageInputItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputItemController ;

type
  TfrmSCUsageInputItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNumberDoc : TLabel;
    edtNumberDoc: TEdit;
    lblNumberInt : TLabel;
    edtNumberInt: TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblScCode : TLabel;
    edtScCode: TEdit;


  HTTPRIOSCUsageInputItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    Label1: TLabel;
    edtKindName: TEdit;
    HTTPRIOSCUsageInputItemKind: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmSCUsageInputItemEdit: TfrmSCUsageInputItemEdit;
  SCUsageInputItemObj: SCUsageInputItem;

implementation

uses SCUsageInputItemKindController;


{uses  
    EnergyproController, EnergyproController2, SCUsageInputItemController  ;
}
{$R *.dfm}



procedure TfrmSCUsageInputItemEdit.FormShow(Sender: TObject);
var TempSCUsageInputItemKind: SCUsageInputItemKindControllerSoapPort;
    SCUsageInputItemKindObj: SCUsageInputItemKind;
begin
  DisableControls([edtCode, edtKindName]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtNumberInt
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(SCUsageInputItemObj.code);
    edtNumberDoc.Text := SCUsageInputItemObj.numberDoc; 
    if ( SCUsageInputItemObj.numberInt <> Low(Integer) ) then
       edtNumberInt.Text := IntToStr(SCUsageInputItemObj.numberInt)
    else
       edtNumberInt.Text := '';
    if ( SCUsageInputItemObj.countGen <> Low(Integer) ) then
       edtCountGen.Text := IntToStr(SCUsageInputItemObj.countGen)
    else
       edtCountGen.Text := '';
    if ( SCUsageInputItemObj.scCode <> Low(Integer) ) then
       edtScCode.Text := IntToStr(SCUsageInputItemObj.scCode)
    else
       edtScCode.Text := '';

    if ( SCUsageInputItemObj.kindRef <> nil ) then
    begin
      TempSCUsageInputItemKind := HTTPRIOSCUsageInputItem as SCUsageInputItemKindControllerSoapPort;
      SCUsageInputItemKindObj := TempSCUsageInputItemKind.getObject(SCUsageInputItemObj.kindRef.code);

      if SCUsageInputItemKindObj <> nil then
        edtKindName.Text := SCUsageInputItemKindObj.name; 
    end;
  end;
end;



procedure TfrmSCUsageInputItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberDoc
      ,edtNumberInt
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;


     SCUsageInputItemObj.numberDoc := edtNumberDoc.Text; 

     if ( edtNumberInt.Text <> '' ) then
       SCUsageInputItemObj.numberInt := StrToInt(edtNumberInt.Text)
     else
       SCUsageInputItemObj.numberInt := Low(Integer) ;

     if ( edtCountGen.Text <> '' ) then
       SCUsageInputItemObj.countGen := StrToInt(edtCountGen.Text)
     else
       SCUsageInputItemObj.countGen := Low(Integer) ;

     if ( edtScCode.Text <> '' ) then
       SCUsageInputItemObj.scCode := StrToInt(edtScCode.Text)
     else
       SCUsageInputItemObj.scCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      SCUsageInputItemObj.code:=low(Integer);
      TempSCUsageInputItem.add(SCUsageInputItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempSCUsageInputItem.save(SCUsageInputItemObj);
    end;
  end;
end;


end.