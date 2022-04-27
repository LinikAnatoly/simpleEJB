
unit EditENTransportDepartmentFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportDepartmentController ;

type
  TfrmENTransportDepartmentFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TMemo;



  HTTPRIOENTransportDepartment: THTTPRIO;

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
  frmENTransportDepartmentFilterEdit: TfrmENTransportDepartmentFilterEdit;
  ENTransportDepartmentFilterObj: ENTransportDepartmentFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransportDepartmentController  ;
}
{$R *.dfm}



procedure TfrmENTransportDepartmentFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtName.Lines, ENTransportDepartmentObj.name);


  end;

}

end;



procedure TfrmENTransportDepartmentFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportDepartment: ENTransportDepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTransportDepartmentFilterObj.name := edtName.Text; 




  end;
end;




end.