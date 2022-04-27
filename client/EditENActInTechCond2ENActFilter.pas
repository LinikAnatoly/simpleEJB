
unit EditENActInTechCond2ENActFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActInTechCond2ENActController ;

type
  TfrmENActInTechCond2ENActFilterEdit = class(TDialogForm)

    lblSummaGen : TLabel;
    edtSummaGen: TEdit;



  HTTPRIOENActInTechCond2ENAct: THTTPRIO;

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
  frmENActInTechCond2ENActFilterEdit: TfrmENActInTechCond2ENActFilterEdit;
  ENActInTechCond2ENActFilterObj: ENActInTechCond2ENActFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActInTechCond2ENActController  ;
}
{$R *.dfm}



procedure TfrmENActInTechCond2ENActFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENActInTechCond2ENActObj.summaGen <> nil ) then
       edtSummaGen.Text := ENActInTechCond2ENActObj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 


  end;

}

end;



procedure TfrmENActInTechCond2ENActFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActInTechCond2ENAct: ENActInTechCond2ENActControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENActInTechCond2ENActFilterObj.summaGen = nil ) then
       ENActInTechCond2ENActFilterObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       ENActInTechCond2ENActFilterObj.summaGen.decimalString := edtSummaGen.Text 
     else
       ENActInTechCond2ENActFilterObj.summaGen := nil;





  end;
end;




end.