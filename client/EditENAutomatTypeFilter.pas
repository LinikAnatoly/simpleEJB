
unit EditENAutomatTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAutomatTypeController ;

type
  TfrmENAutomatTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENAutomatType: THTTPRIO;

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
  frmENAutomatTypeFilterEdit: TfrmENAutomatTypeFilterEdit;
  ENAutomatTypeFilterObj: ENAutomatTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAutomatTypeController  ;
}
{$R *.dfm}



procedure TfrmENAutomatTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENAutomatTypeObj.name; 


  end;

}

end;



procedure TfrmENAutomatTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAutomatType: ENAutomatTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAutomatTypeFilterObj.name := edtName.Text; 




  end;
end;




end.