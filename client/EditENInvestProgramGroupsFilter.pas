
unit EditENInvestProgramGroupsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENInvestProgramGroupsController ;

type
  TfrmENInvestProgramGroupsFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENInvestProgramGroups: THTTPRIO;

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
  frmENInvestProgramGroupsFilterEdit: TfrmENInvestProgramGroupsFilterEdit;
  ENInvestProgramGroupsFilterObj: ENInvestProgramGroupsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENInvestProgramGroupsController  ;
}
{$R *.dfm}



procedure TfrmENInvestProgramGroupsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENInvestProgramGroupsObj.name; 


  end;

}

end;



procedure TfrmENInvestProgramGroupsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENInvestProgramGroupsFilterObj.name := edtName.Text; 




  end;
end;




end.