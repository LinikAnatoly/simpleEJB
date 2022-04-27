
unit EditENTechCondResponsiblesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTechCondResponsiblesController ;

type
  TfrmENTechCondResponsiblesFilterEdit = class(TDialogForm)

    lblResponsibleFIO : TLabel;
    edtResponsibleFIO: TEdit;

    lblResponsibleTabNumber : TLabel;
    edtResponsibleTabNumber: TEdit;

    lblResponsiblePosition : TLabel;
    edtResponsiblePosition: TEdit;

    lblResponsibleDepName : TLabel;
    edtResponsibleDepName: TEdit;

    lblResponsibleDepCode : TLabel;
    edtResponsibleDepCode: TEdit;

    lblPower : TLabel;
    edtPower: TEdit;



  HTTPRIOENTechCondResponsibles: THTTPRIO;

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
  frmENTechCondResponsiblesFilterEdit: TfrmENTechCondResponsiblesFilterEdit;
  ENTechCondResponsiblesFilterObj: ENTechCondResponsiblesFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTechCondResponsiblesController  ;
}
{$R *.dfm}



procedure TfrmENTechCondResponsiblesFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPower
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtResponsibleFIO.Text := ENTechCondResponsiblesObj.responsibleFIO; 



    if ( ENTechCondResponsiblesObj.responsibleTabNumber <> Low(Integer) ) then
       edtResponsibleTabNumber.Text := IntToStr(ENTechCondResponsiblesObj.responsibleTabNumber)
    else
       edtResponsibleTabNumber.Text := '';



    edtResponsiblePosition.Text := ENTechCondResponsiblesObj.responsiblePosition; 



    edtResponsibleDepName.Text := ENTechCondResponsiblesObj.responsibleDepName; 



    edtResponsibleDepCode.Text := ENTechCondResponsiblesObj.responsibleDepCode; 



    if ( ENTechCondResponsiblesObj.power <> Low(Integer) ) then
       edtPower.Text := IntToStr(ENTechCondResponsiblesObj.power)
    else
       edtPower.Text := '';


  end;

}

end;



procedure TfrmENTechCondResponsiblesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTechCondResponsiblesFilterObj.responsibleFIO := edtResponsibleFIO.Text; 



     if ( edtResponsibleTabNumber.Text <> '' ) then
       ENTechCondResponsiblesFilterObj.responsibleTabNumber := StrToInt(edtResponsibleTabNumber.Text)
     else
       ENTechCondResponsiblesFilterObj.responsibleTabNumber := Low(Integer) ;




     ENTechCondResponsiblesFilterObj.responsiblePosition := edtResponsiblePosition.Text; 



     ENTechCondResponsiblesFilterObj.responsibleDepName := edtResponsibleDepName.Text; 



     ENTechCondResponsiblesFilterObj.responsibleDepCode := edtResponsibleDepCode.Text; 



     if ( edtPower.Text <> '' ) then
       ENTechCondResponsiblesFilterObj.power := StrToInt(edtPower.Text)
     else
       ENTechCondResponsiblesFilterObj.power := Low(Integer) ;





  end;
end;




end.