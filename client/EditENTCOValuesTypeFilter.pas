
unit EditENTCOValuesTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTCOValuesTypeController ;

type
  TfrmENTCOValuesTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENTCOValuesType: THTTPRIO;

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
  frmENTCOValuesTypeFilterEdit: TfrmENTCOValuesTypeFilterEdit;
  ENTCOValuesTypeFilterObj: ENTCOValuesTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTCOValuesTypeController  ;
}
{$R *.dfm}



procedure TfrmENTCOValuesTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENTCOValuesTypeObj.name; 


  end;

}

end;



procedure TfrmENTCOValuesTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTCOValuesType: ENTCOValuesTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTCOValuesTypeFilterObj.name := edtName.Text; 




  end;
end;




end.