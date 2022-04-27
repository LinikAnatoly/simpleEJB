
unit EditENInvestProgramGroups;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENInvestProgramGroupsController ;

type
  TfrmENInvestProgramGroupsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCommentgen : TLabel;
    edtCommentgen: TEdit;


  HTTPRIOENInvestProgramGroups: THTTPRIO;

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
  frmENInvestProgramGroupsEdit: TfrmENInvestProgramGroupsEdit;
  ENInvestProgramGroupsObj: ENInvestProgramGroups;

implementation


{uses  
    EnergyproController, EnergyproController2, ENInvestProgramGroupsController  ;
}
{$R *.dfm}



procedure TfrmENInvestProgramGroupsEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENInvestProgramGroupsObj.code);
    edtName.Text := ENInvestProgramGroupsObj.name; 
    edtCommentgen.Text := ENInvestProgramGroupsObj.commentgen; 


  end;
end;



procedure TfrmENInvestProgramGroupsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENInvestProgramGroups := HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;


     ENInvestProgramGroupsObj.name := edtName.Text; 

     ENInvestProgramGroupsObj.commentgen := edtCommentgen.Text; 

    if DialogState = dsInsert then
    begin
      ENInvestProgramGroupsObj.code:=low(Integer);
      TempENInvestProgramGroups.add(ENInvestProgramGroupsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENInvestProgramGroups.save(ENInvestProgramGroupsObj);
    end;
  end;
end;


end.