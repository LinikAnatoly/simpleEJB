
unit EditENPanelTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPanelTypeController ;

type
  TfrmENPanelTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENPanelType: THTTPRIO;

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
  frmENPanelTypeFilterEdit: TfrmENPanelTypeFilterEdit;
  ENPanelTypeFilterObj: ENPanelTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPanelTypeController  ;
}
{$R *.dfm}



procedure TfrmENPanelTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPanelTypeObj.name; 


  end;

}

end;



procedure TfrmENPanelTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPanelType: ENPanelTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPanelTypeFilterObj.name := edtName.Text; 




  end;
end;




end.