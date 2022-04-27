unit EditENGeographicDepartment;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENGeographicDepartmentController ;

type
  TfrmENGeographicDepartmentEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCommentgen : TLabel;
    edtCommentgen: TEdit;


    HTTPRIOENGeographicDepartment: THTTPRIO;

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
  frmENGeographicDepartmentEdit: TfrmENGeographicDepartmentEdit;
  ENGeographicDepartmentObj: ENGeographicDepartment;

implementation



{$R *.dfm}

procedure TfrmENGeographicDepartmentEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtName
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENGeographicDepartmentObj.code);
    edtName.Text := ENGeographicDepartmentObj.name;
    edtCommentgen.Text := ENGeographicDepartmentObj.commentgen;
  end;
end;



procedure TfrmENGeographicDepartmentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;

    ENGeographicDepartmentObj.name := edtName.Text; 
    ENGeographicDepartmentObj.commentgen := edtCommentgen.Text; 

    if DialogState = dsInsert then
    begin
      ENGeographicDepartmentObj.code := Low(Integer);
      TempENGeographicDepartment.add(ENGeographicDepartmentObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENGeographicDepartment.save(ENGeographicDepartmentObj);
    end;
  end;
end;


end.