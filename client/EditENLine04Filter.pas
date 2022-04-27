
unit EditENLine04Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENLine04Controller ;

type
  TfrmENLine04FilterEdit = class(TDialogForm)

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblYearBuild : TLabel;
    edtYearBuild: TEdit;
    lblYearWorkingStart : TLabel;
    edtYearWorkingStart: TEdit;
    lblNameProject : TLabel;
    edtNameProject: TEdit;
    lblNameBuilder : TLabel;
    edtNameBuilder: TEdit;
    lblMainCustomersData : TLabel;
    edtMainCustomersData: TEdit;
    lblMoreData : TLabel;
    edtMoreData: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;

    lblEPWorkerName : TLabel;
    edtEPWorkerName: TEdit;

    HTTPRIOENLine04: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    spbEPWorker: TSpeedButton;
    lblENSubstation04Name: TLabel;
    edtENSubstation04Name: TEdit;
    spbENSubstation04: TSpeedButton;
    HTTPRIOENSubstation04: THTTPRIO;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbEPWorkerClick(Sender: TObject);
    procedure spbENSubstation04Click(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);

  private
    { Private declarations }
    renCondition : string;
    elementInCondition : String;

  public
    { Public declarations }

end;

var
  frmENLine04FilterEdit: TfrmENLine04FilterEdit;
  ENLine04FilterObj: ENLine04Filter;
  //ENLine04Obj: ENLine04;

implementation


uses ShowEPWorker, ShowENElement, ENElementController, ShowENSubstation04,
  ENSubstation04Controller, ShowENEPRen;
{uses
    EnergyproController, EnergyproController2, ENLine04Controller  ;
}
{$R *.dfm}



procedure TfrmENLine04FilterEdit.FormShow(Sender: TObject);

begin

  renCondition := '';
  elementInCondition := '';

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtInvNumber
      ,edtName
      ,edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtInvNumber.Text := ENLine04Obj.invNumber; 



    edtName.Text := ENLine04Obj.name; 



    if ( ENLine04Obj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENLine04Obj.yearBuild)
    else
       edtYearBuild.Text := '';



    if ( ENLine04Obj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENLine04Obj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';



    edtNameProject.Text := ENLine04Obj.nameProject; 



    edtNameBuilder.Text := ENLine04Obj.nameBuilder; 



    edtMainCustomersData.Text := ENLine04Obj.mainCustomersData; 



    edtMoreData.Text := ENLine04Obj.moreData; 



      if ENLine04Obj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENLine04Obj.dateGen.Year,ENLine04Obj.dateGen.Month,ENLine04Obj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;


  end;

}

end;



procedure TfrmENLine04FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLine04: ENLine04ControllerSoapPort;
condition : string;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLine04FilterObj.invNumber := edtInvNumber.Text; 



     ENLine04FilterObj.name := edtName.Text; 



     if ( edtYearBuild.Text <> '' ) then
       ENLine04FilterObj.yearBuild := StrToInt(edtYearBuild.Text)
     else
       ENLine04FilterObj.yearBuild := Low(Integer) ;




     if ( edtYearWorkingStart.Text <> '' ) then
       ENLine04FilterObj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
     else
       ENLine04FilterObj.yearWorkingStart := Low(Integer) ;




     ENLine04FilterObj.nameProject := edtNameProject.Text; 



     ENLine04FilterObj.nameBuilder := edtNameBuilder.Text; 



     ENLine04FilterObj.mainCustomersData := edtMainCustomersData.Text; 



     ENLine04FilterObj.moreData := edtMoreData.Text; 



     if edtDateGen.Checked then
     begin
       if ENLine04FilterObj.dateGen = nil then
         ENLine04FilterObj.dateGen := TXSDate.Create;
       ENLine04FilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end;

     condition := '';

     if renCondition <> '' then
       AddCondition(condition, renCondition);

     if elementInCondition <> '' then
       AddCondition(condition, elementInCondition);

     if ENLine04FilterObj.conditionSQL <> '' then
       ENLine04FilterObj.conditionSQL := ENLine04FilterObj.conditionSQL + ' and ' + condition
     else
       ENLine04FilterObj.conditionSQL := condition;
       
  end;
end;

procedure TfrmENLine04FilterEdit.spbEPWorkerClick(Sender: TObject);
var
   frmEPWorkerShow: TfrmEPWorkerShow;
begin
   frmEPWorkerShow:=TfrmEPWorkerShow.Create(Application,fmNormal);
   try
      with frmEPWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine04FilterObj.worker = nil then ENLine04FilterObj.worker := EPWorker.Create();
               ENLine04FilterObj.worker.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPWorkerName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPWorkerShow.Free;
   end;
end;

procedure TfrmENLine04FilterEdit.spbENSubstation04Click(Sender: TObject);
var 
   frmENSubstation04Show: TfrmENSubstation04Show;
    TempENSubstation04: ENSubstation04ControllerSoapPort;
    ENSb : ENSubstation04;
begin
   frmENSubstation04Show:=TfrmENSubstation04Show.Create(Application,fmNormal);
   try
      with frmENSubstation04Show do
        if ShowModal = mrOk then
        begin
            try
               //if ENLine04FilterObj.element = nil then ENLine04FilterObj.element := ENElement.Create();
               //ENLine04FilterObj.element.elementInRef := ENElementRef.Create;

               //ENSb := ENSubstation04.Create;
               TempENSubstation04 :=  frmENLine04FilterEdit.HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
               ENSb := TempENSubstation04.getObject(StrToInt(GetReturnValue(sgENSubstation04,0)));

               //ENLine04FilterObj.element.elementInRef.code := ENSb.element.code ;//StrToInt(GetReturnValue(sgENSubstation04,0));

               elementInCondition := ' enline04.elementcode in (select e.code from enelement e where e.elementinrefcode = '+  IntToStr(ENSb.element.code) +')';

               {
               if (length(ENLine04FilterObj.conditionSQL) = 0 ) then
                  ENLine04FilterObj.conditionSQL := ' elementcode in (select e.code from enelement e where e.elementinrefcode = '+  IntToStr(ENSb.element.code) +')'
               else
                  ENLine04FilterObj.conditionSQL := ENLine04FilterObj.conditionSQL + ' and elementcode in (select e.code from enelement e where e.elementinrefcode = '+  IntToStr(ENSb.element.code) +')';
               }
               edtENSubstation04Name.Text:=GetReturnValue(sgENSubstation04,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENSubstation04Show.Free;
   end;
end;

procedure TfrmENLine04FilterEdit.spbEPRenClick(Sender: TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try

               //if (length(ENLine04FilterObj.conditionSQL) = 0 ) then
               //   ENLine04FilterObj.conditionSQL := ' elementcode in (select e.code from enelement e where e.renrefcode = '+  GetReturnValue(sgEPRen,0) +')'
               //else
               //   ENLine04FilterObj.conditionSQL := ENLine04FilterObj.conditionSQL + ' and elementcode in (select e.code from enelement e where e.renrefcode = '+  GetReturnValue(sgEPRen,0) +')';

               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
               renCondition := ' enline04.elementcode in (select e.code from enelement e where e.renrefcode = '+  GetReturnValue(sgEPRen,0) +')';
                  
              {
               if ENElementFilterObj.renRef = nil then ENElementFilterObj.renRef := EPRenRef.Create();
               ENElementFilterObj.renRef.code  := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
               }
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

end.
