
unit EditENBonusListFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBonusListController ;

type
  TfrmENBonusListFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblMonthGen : TLabel;
    edtMonthGen: TEdit;

    lblYearGen : TLabel;
    edtYearGen: TEdit;



  HTTPRIOENBonusList: THTTPRIO;

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
  frmENBonusListFilterEdit: TfrmENBonusListFilterEdit;
  ENBonusListFilterObj: ENBonusListFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBonusListController  ;
}
{$R *.dfm}



procedure TfrmENBonusListFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtMonthGen
      ,edtYearGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := ENBonusListObj.numberGen; 



    if ( ENBonusListObj.monthGen <> Low(Integer) ) then
       edtMonthGen.Text := IntToStr(ENBonusListObj.monthGen)
    else
       edtMonthGen.Text := '';



    if ( ENBonusListObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(ENBonusListObj.yearGen)
    else
       edtYearGen.Text := '';


  end;

}

end;



procedure TfrmENBonusListFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENBonusList: ENBonusListControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBonusListFilterObj.numberGen := edtNumberGen.Text; 



     if ( edtMonthGen.Text <> '' ) then
       ENBonusListFilterObj.monthGen := StrToInt(edtMonthGen.Text)
     else
       ENBonusListFilterObj.monthGen := Low(Integer) ;




     if ( edtYearGen.Text <> '' ) then
       ENBonusListFilterObj.yearGen := StrToInt(edtYearGen.Text)
     else
       ENBonusListFilterObj.yearGen := Low(Integer) ;





  end;
end;




end.