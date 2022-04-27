
unit EditENDepartmentTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDepartmentTypeController ;

type
  TfrmENDepartmentTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENDepartmentType: THTTPRIO;

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
  frmENDepartmentTypeFilterEdit: TfrmENDepartmentTypeFilterEdit;
  ENDepartmentTypeFilterObj: ENDepartmentTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDepartmentTypeController  ;
}
{$R *.dfm}



procedure TfrmENDepartmentTypeFilterEdit.FormShow(Sender: TObject);

begin

{ ���� ���� �� ������ ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENDepartmentTypeObj.name; 


  end;

}

end;



procedure TfrmENDepartmentTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDepartmentType: ENDepartmentTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDepartmentTypeFilterObj.name := edtName.Text; 




  end;
end;




end.