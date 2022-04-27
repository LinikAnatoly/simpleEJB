
unit EditENWiresType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWiresTypeController ;

type
  TfrmENWiresTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblIsCabel : TLabel;
    edtIsCabel: TEdit;


  HTTPRIOENWiresType: THTTPRIO;

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
  frmENWiresTypeEdit: TfrmENWiresTypeEdit;
  ENWiresTypeObj: ENWiresType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWiresTypeController  ;
}
{$R *.dfm}



procedure TfrmENWiresTypeEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtIsCabel
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENWiresTypeObj.code);
    edtName.Text := ENWiresTypeObj.name; 
    if ( ENWiresTypeObj.isCabel <> Low(Integer) ) then
       edtIsCabel.Text := IntToStr(ENWiresTypeObj.isCabel)
    else
       edtIsCabel.Text := '';


  end;
end;



procedure TfrmENWiresTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWiresType: ENWiresTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtIsCabel
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENWiresType := HTTPRIOENWiresType as ENWiresTypeControllerSoapPort;


     ENWiresTypeObj.name := edtName.Text; 

     if ( edtIsCabel.Text <> '' ) then
       ENWiresTypeObj.isCabel := StrToInt(edtIsCabel.Text)
     else
       ENWiresTypeObj.isCabel := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENWiresTypeObj.code:=low(Integer);
      TempENWiresType.add(ENWiresTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWiresType.save(ENWiresTypeObj);
    end;
  end;
end;


end.