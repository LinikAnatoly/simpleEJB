
unit EditFINMol;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINMolController ;

type
  TfrmFINMolEdit = class(TDialogForm)

    lblText : TLabel;
    edtText: TEdit;
    lblObj_id : TLabel;
    edtObj_id: TEdit;
    lblState : TLabel;
    edtState: TEdit;


  HTTPRIOFINMol: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmFINMolEdit: TfrmFINMolEdit;
  FINMolObj: FINMol;

implementation


{uses  
    EnergyproController, EnergyproController2, FINMolController  ;
}
{$R *.dfm}



procedure TfrmFINMolEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtText
      ,edtObj_id
      ,edtState
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtText.Text := FINMolObj.text; 
    if ( FINMolObj.obj_id <> Low(Integer) ) then
       edtObj_id.Text := IntToStr(FINMolObj.obj_id)
    else
       edtObj_id.Text := '';
    if ( FINMolObj.state <> Low(Integer) ) then
       edtState.Text := IntToStr(FINMolObj.state)
    else
       edtState.Text := '';


  end;
end;



procedure TfrmFINMolEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINMol: FINMolControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtText
      ,edtObj_id
      ,edtState
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFINMol := HTTPRIOFINMol as FINMolControllerSoapPort;


     FINMolObj.text := edtText.Text; 

     if ( edtObj_id.Text <> '' ) then
       FINMolObj.obj_id := StrToInt(edtObj_id.Text)
     else
       FINMolObj.obj_id := Low(Integer) ;

     if ( edtState.Text <> '' ) then
       FINMolObj.state := StrToInt(edtState.Text)
     else
       FINMolObj.state := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      FINMolObj.id:= '-1'; //low(Integer);
      TempFINMol.add(FINMolObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINMol.save(FINMolObj);
    end;
  end;
end;


end.