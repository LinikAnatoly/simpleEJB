
unit EditENWorkerFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkerController ;

type
  TfrmENWorkerFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblTabNumber : TLabel;
    edtTabNumber: TEdit;
    lblIsMol : TLabel;
    edtIsMol: TEdit;
    lblFinCode : TLabel;
    edtFinCode: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENManningTableManningTableName : TLabel;
  edtENManningTableManningTableName : TEdit;
  spbENManningTableManningTable : TSpeedButton;
  

  HTTPRIOENWorker: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENManningTableManningTableClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENWorkerFilterEdit: TfrmENWorkerFilterEdit;
  ENWorkerFilterObj: ENWorkerFilter;

implementation

uses
  ShowENManningTable
  ,ENManningTableController
;

{uses  
    EnergyproController, EnergyproController2, ENWorkerController  ;
}
{$R *.dfm}



procedure TfrmENWorkerFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtTabNumber
      ,edtIsMol
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENWorkerObj.name; 



    edtTabNumber.Text := ENWorkerObj.tabNumber; 



    if ( ENWorkerObj.isMol <> Low(Integer) ) then
       edtIsMol.Text := IntToStr(ENWorkerObj.isMol)
    else
       edtIsMol.Text := '';



    if ( ENWorkerObj.finCode <> Low(Integer) ) then
       edtFinCode.Text := IntToStr(ENWorkerObj.finCode)
    else
       edtFinCode.Text := '';



    edtCommentGen.Text := ENWorkerObj.commentGen; 


  end;

}

end;



procedure TfrmENWorkerFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorker: ENWorkerControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENWorkerFilterObj.name := edtName.Text; 



     ENWorkerFilterObj.tabNumber := edtTabNumber.Text; 



     if ( edtIsMol.Text <> '' ) then
       ENWorkerFilterObj.isMol := StrToInt(edtIsMol.Text)
     else
       ENWorkerFilterObj.isMol := Low(Integer) ;




     if ( edtFinCode.Text <> '' ) then
       ENWorkerFilterObj.finCode := StrToInt(edtFinCode.Text)
     else
       ENWorkerFilterObj.finCode := Low(Integer) ;




     ENWorkerFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;

procedure TfrmENWorkerFilterEdit.spbENManningTableManningTableClick(Sender : TObject);
var 
   frmENManningTableShow: TfrmENManningTableShow;
begin
   frmENManningTableShow:=TfrmENManningTableShow.Create(Application,fmNormal);
   try
      with frmENManningTableShow do
        if ShowModal = mrOk then
        begin
            try
               if ENWorkerFilterObj.manningTable = nil then ENWorkerFilterObj.manningTable := ENManningTable.Create();
               ENWorkerFilterObj.manningTable.code := StrToInt(GetReturnValue(sgENManningTable,0));
               edtENManningTableManningTableName.Text:=GetReturnValue(sgENManningTable,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENManningTableShow.Free;
   end;
end;





end.