
unit EditENSubstation04Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
 	  EnergyproController, EnergyproController2, ENSubstation04Controller ;

type
  TfrmENSubstation04FilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblNominalPower : TLabel;
    edtNominalPower: TEdit;

    HTTPRIOENSubstation04: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    lblEPWorkerName : TLabel;
    edtEPWorkerName: TEdit;

    spbEPWorker: TSpeedButton;
    lblENLine10Name: TLabel;
    edtENLine10Name: TEdit;
    spbENLine10: TSpeedButton;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    lblENSubstationTypeName: TLabel;
    edtENSubstationTypeName: TEdit;
    spbENSubstationType: TSpeedButton;
    lblBelonging: TLabel;
    cbBelongingType: TComboBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbEPWorkerClick(Sender: TObject);
  procedure spbENLine10Click(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbENSubstationTypeClick(Sender: TObject);

  private
    { Private declarations }
    renCondition : string;
    elementInCondition : string;
  public
    { Public declarations }

end;

var
  frmENSubstation04FilterEdit: TfrmENSubstation04FilterEdit;
  ENSubstation04FilterObj: ENSubstation04Filter;
  //ENSubstation04Obj: ENSubstation04;

implementation

uses ShowEPWorker, ShowENElement, ENElementController, ShowENLine10,
  ShowENEPRen, ShowENSubstationType, ENSubstationTypeController,
  ENBelongingController;
{$R *.dfm}



procedure TfrmENSubstation04FilterEdit.FormShow(Sender: TObject);

begin

   renCondition := '';
   elementInCondition := '';

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENSubstation04Obj.name; 



    if ( ENSubstation04Obj.nominalPower <> nil ) then
       edtNominalPower.Text := ENSubstation04Obj.nominalPower.decimalString
    else
       edtNominalPower.Text := ''; 


  end;

}

end;



procedure TfrmENSubstation04FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubstation04: ENSubstation04ControllerSoapPort;
condition : string;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubstation04FilterObj.name := edtName.Text;
     ENSubstation04FilterObj.invNumber := edtInvNumber.Text;

     if  edtNominalPower.Text <> '' then
     begin
       if (ENSubstation04FilterObj.nominalPower = nil ) then
         ENSubstation04FilterObj.nominalPower := TXSDecimal.Create;
       ENSubstation04FilterObj.nominalPower.decimalString := edtNominalPower.Text ;
     end
     else
       ENSubstation04FilterObj.nominalPower := nil;

     if cbBelongingType.ItemIndex > 0 then
       begin
         if ENSubstation04FilterObj.belongingRef = nil then
           ENSubstation04FilterObj.belongingRef := ENBelongingRef.Create;
         ENSubstation04FilterObj.belongingRef.code :=
           cbBelongingType.ItemIndex - 1;
       end;

     condition := '';

     if renCondition <> '' then
       AddCondition(condition, renCondition);

     if elementInCondition <> '' then
       AddCondition(condition, elementInCondition);

     if ENSubstation04FilterObj.conditionSQL <> '' then
       ENSubstation04FilterObj.conditionSQL := ENSubstation04FilterObj.conditionSQL + ' and ' + condition
     else
       ENSubstation04FilterObj.conditionSQL := condition;

  end;
end;


procedure TfrmENSubstation04FilterEdit.spbEPWorkerClick(Sender: TObject);
var
   frmEPWorkerShow: TfrmEPWorkerShow;
begin
   frmEPWorkerShow:=TfrmEPWorkerShow.Create(Application,fmNormal);
   try
      with frmEPWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubstation04FilterObj.worker = nil then ENSubstation04FilterObj.worker := EPWorker.Create();
               ENSubstation04FilterObj.worker.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPWorkerName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPWorkerShow.Free;
   end;
end;

procedure TfrmENSubstation04FilterEdit.spbENLine10Click(Sender: TObject);
var
   frmENLine10Show: TfrmENLine10Show;
begin
   frmENLine10Show:=TfrmENLine10Show.Create(Application,fmNormal);
   try
      with frmENLine10Show do
        if ShowModal = mrOk then
        begin
            try
               //if ENSubstation04FilterObj.element = nil then ENSubstation04FilterObj.element := ENElement.Create();
               //ENSubstation04FilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               //ENSubstation04FilterObj.conditionSQL := ' ensubstation04.elementcode in (select e.code from enelement e where e.elementinrefcode in (select l.elementcode from enline10 l where l.code ='+ GetReturnValue(sgENLine10,0) +'))';

               elementInCondition := ' ensubstation04.elementcode in (select e.code from enelement e where e.elementinrefcode in (select l.elementcode from enline10 l where l.code ='+ GetReturnValue(sgENLine10,0) +'))';

               edtENLine10Name.Text:=GetReturnValue(sgENLine10,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENLine10Show.Free;
   end;
end;

procedure TfrmENSubstation04FilterEdit.spbEPRenClick(Sender: TObject);
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
               renCondition := ' elementcode in (select e.code from enelement e where e.renrefcode = '+  GetReturnValue(sgEPRen,0) +')';

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

procedure TfrmENSubstation04FilterEdit.spbENSubstationTypeClick(
  Sender: TObject);
var frmENSubstationTypeShow: TfrmENSubstationTypeShow;
begin
  frmENSubstationTypeShow :=
    TfrmENSubstationTypeShow.Create(Application,fmNormal);
  try
    with frmENSubstationTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENSubstation04FilterObj.substationType = nil then
              ENSubstation04FilterObj.substationType :=
                ENSubstationType.Create();
            ENSubstation04FilterObj.substationType.code :=
              StrToInt(GetReturnValue(sgENSubstationType, 0));
            edtENSubstationTypeName.Text :=
              GetReturnValue(sgENSubstationType, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENSubstationTypeShow.Free;
  end;
end;

end.


