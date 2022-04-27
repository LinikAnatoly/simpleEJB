
unit EditENInsulatorTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENInsulatorTypeController ;

type
  TfrmENInsulatorTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENInsulatorType: THTTPRIO;

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
  frmENInsulatorTypeFilterEdit: TfrmENInsulatorTypeFilterEdit;
  ENInsulatorTypeFilterObj: ENInsulatorTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENInsulatorTypeController  ;
}
{$R *.dfm}



procedure TfrmENInsulatorTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENInsulatorTypeObj.name; 


  end;

}

end;



procedure TfrmENInsulatorTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENInsulatorType: ENInsulatorTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENInsulatorTypeFilterObj.name := edtName.Text; 




  end;
end;




end.