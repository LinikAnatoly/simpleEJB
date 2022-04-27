
unit EditENContactBreakerTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContactBreakerTypeController ;

type
  TfrmENContactBreakerTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENContactBreakerType: THTTPRIO;

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
  frmENContactBreakerTypeFilterEdit: TfrmENContactBreakerTypeFilterEdit;
  ENContactBreakerTypeFilterObj: ENContactBreakerTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENContactBreakerTypeController  ;
}
{$R *.dfm}



procedure TfrmENContactBreakerTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENContactBreakerTypeObj.name; 


  end;

}

end;



procedure TfrmENContactBreakerTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContactBreakerType: ENContactBreakerTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENContactBreakerTypeFilterObj.name := edtName.Text; 




  end;
end;




end.