
unit EditRQCentralExportGraphFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQCentralExportGraphController ;

type
  TfrmRQCentralExportGraphFilterEdit = class(TDialogForm)

    lblMonthGen : TLabel;
    edtMonthGen: TEdit;

    lblYearGen : TLabel;
    edtYearGen: TEdit;



  HTTPRIORQCentralExportGraph: THTTPRIO;

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
  frmRQCentralExportGraphFilterEdit: TfrmRQCentralExportGraphFilterEdit;
  RQCentralExportGraphFilterObj: RQCentralExportGraphFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQCentralExportGraphController  ;
}
{$R *.dfm}



procedure TfrmRQCentralExportGraphFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMonthGen
      ,edtYearGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQCentralExportGraphObj.monthGen <> Low(Integer) ) then
       edtMonthGen.Text := IntToStr(RQCentralExportGraphObj.monthGen)
    else
       edtMonthGen.Text := '';



    if ( RQCentralExportGraphObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(RQCentralExportGraphObj.yearGen)
    else
       edtYearGen.Text := '';


  end;

}

end;



procedure TfrmRQCentralExportGraphFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQCentralExportGraph: RQCentralExportGraphControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtMonthGen.Text <> '' ) then
       RQCentralExportGraphFilterObj.monthGen := StrToInt(edtMonthGen.Text)
     else
       RQCentralExportGraphFilterObj.monthGen := Low(Integer) ;




     if ( edtYearGen.Text <> '' ) then
       RQCentralExportGraphFilterObj.yearGen := StrToInt(edtYearGen.Text)
     else
       RQCentralExportGraphFilterObj.yearGen := Low(Integer) ;





  end;
end;




end.