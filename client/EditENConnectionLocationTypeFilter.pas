
unit EditENConnectionLocationTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionLocationTypeController ;

type
  TfrmENConnectionLocationTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENConnectionLocationType: THTTPRIO;

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
  frmENConnectionLocationTypeFilterEdit: TfrmENConnectionLocationTypeFilterEdit;
  ENConnectionLocationTypeFilterObj: ENConnectionLocationTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionLocationTypeController  ;
}
{$R *.dfm}



procedure TfrmENConnectionLocationTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENConnectionLocationTypeObj.name; 


  end;

}

end;



procedure TfrmENConnectionLocationTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionLocationType: ENConnectionLocationTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENConnectionLocationTypeFilterObj.name := edtName.Text; 




  end;
end;




end.