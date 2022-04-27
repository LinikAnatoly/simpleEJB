
unit EditENTransformerTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransformerTypeController ;

type
  TfrmENTransformerTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENTransformerType: THTTPRIO;

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
  frmENTransformerTypeFilterEdit: TfrmENTransformerTypeFilterEdit;
  ENTransformerTypeFilterObj: ENTransformerTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransformerTypeController  ;
}
{$R *.dfm}



procedure TfrmENTransformerTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENTransformerTypeObj.name; 


  end;

}

end;



procedure TfrmENTransformerTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransformerType: ENTransformerTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTransformerTypeFilterObj.name := edtName.Text; 




  end;
end;




end.