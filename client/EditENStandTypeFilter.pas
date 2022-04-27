
unit EditENStandTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENStandTypeController ;

type
  TfrmENStandTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENStandType: THTTPRIO;

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
  frmENStandTypeFilterEdit: TfrmENStandTypeFilterEdit;
  ENStandTypeFilterObj: ENStandTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENStandTypeController  ;
}
{$R *.dfm}



procedure TfrmENStandTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENStandTypeObj.name; 


  end;

}

end;



procedure TfrmENStandTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENStandType: ENStandTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENStandTypeFilterObj.name := edtName.Text; 




  end;
end;




end.