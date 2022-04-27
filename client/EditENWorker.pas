
unit EditENWorker;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkerController ;

type
  TfrmENWorkerEdit = class(TDialogForm)

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
  frmENWorkerEdit: TfrmENWorkerEdit;
  ENWorkerObj: ENWorker;

implementation

uses
  ShowENManningTable
  ,ENManningTableController
;

{uses  
    EnergyproController, EnergyproController2, ENWorkerController  ;
}
{$R *.dfm}



procedure TfrmENWorkerEdit.FormShow(Sender: TObject);

begin
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

    edtENManningTableManningTableName.Text := ENWorkerObj.manningTable.name;

  end;
end;



procedure TfrmENWorkerEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorker: ENWorkerControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtTabNumber
      ,edtIsMol
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENWorker := HTTPRIOENWorker as ENWorkerControllerSoapPort;


     ENWorkerObj.name := edtName.Text; 

     ENWorkerObj.tabNumber := edtTabNumber.Text; 

     if ( edtIsMol.Text <> '' ) then
       ENWorkerObj.isMol := StrToInt(edtIsMol.Text)
     else
       ENWorkerObj.isMol := Low(Integer) ;

     if ( edtFinCode.Text <> '' ) then
       ENWorkerObj.finCode := StrToInt(edtFinCode.Text)
     else
       ENWorkerObj.finCode := Low(Integer) ;

     ENWorkerObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENWorkerObj.code:=low(Integer);
      TempENWorker.add(ENWorkerObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWorker.save(ENWorkerObj);
    end;
  end;
end;


procedure TfrmENWorkerEdit.spbENManningTableManningTableClick(Sender : TObject);
var 
   frmENManningTableShow: TfrmENManningTableShow;
begin
   frmENManningTableShow:=TfrmENManningTableShow.Create(Application,fmNormal);
   try
      with frmENManningTableShow do
        if ShowModal = mrOk then
        begin
            try
               if ENWorkerObj.manningTable = nil then ENWorkerObj.manningTable := ENManningTable.Create();
               ENWorkerObj.manningTable.code := StrToInt(GetReturnValue(sgENManningTable,0));
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