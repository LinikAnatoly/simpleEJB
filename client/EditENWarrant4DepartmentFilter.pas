
unit EditENWarrant4DepartmentFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENWarrant4DepartmentController;

type
    TfrmENWarrant4DepartmentFilterEdit = class(TDialogForm)

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    HTTPRIOENWarrant4Department: THTTPRIO;

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
  frmENWarrant4DepartmentFilterEdit: TfrmENWarrant4DepartmentFilterEdit;
  ENWarrant4DepartmentFilterObj: ENWarrant4DepartmentFilter;

implementation



{$R *.dfm}



procedure TfrmENWarrant4DepartmentFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
     edtUserGen.Text := ENWarrant4DepartmentObj.userGen;
   end;
}

end;


procedure TfrmENWarrant4DepartmentFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENWarrant4Department: ENWarrant4DepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
    ENWarrant4DepartmentFilterObj.userGen := edtUserGen.Text;
  end;
end;



end.