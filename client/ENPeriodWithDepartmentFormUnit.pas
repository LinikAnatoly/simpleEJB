unit ENPeriodWithDepartmentFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls , ENPlanWorkController;

type
  TfrmENPeriodWithDepartment = class(TDialogForm)
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    renCode: Integer;
    renName: String;

    //ENPlanWorkObj: ENPlanWork;
    { Public declarations }
  end;

var
  frmENPeriodWithDepartment: TfrmENPeriodWithDepartment;

implementation

{$R *.dfm}
 uses  FINExecutorController, ShowFINExecutor,
  ShowFINExecutorTree , ShowENDepartment , ENDepartmentController , ChildFormUnit , EnergyproController , DMReportsUnit ;

procedure TfrmENPeriodWithDepartment.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
  
end;

procedure TfrmENPeriodWithDepartment.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENPeriodWithDepartment.btnOkClick(Sender: TObject);
//var argNames, args: ArrayOfString; reportName: String;
 //»сключено объ€вление не используемых переменных  //var ys,ms,ds,yf,mf,df: Word;
begin
{DecodeDate(edtDateStart.date,ys,ms,ds);
DecodeDate(edtDateFinal.date,yf,mf,df);

  IF  ms <> mf then
    Begin
         Application.MessageBox(PChar('«в≥т формуЇтьс€ т≥льки в межах одного м≥с€ц€  !!!'), PChar('”вага!'),MB_ICONWARNING);
         ModalResult:= mrNone;
    end
    else

     if edtDateStart.date > edtDateFinal.date then
        Begin
         Application.MessageBox(PChar('ѕочаткова дата не може бути б≥льшою за к≥нцеву дату !!!'), PChar('”вага!'),MB_ICONWARNING);
         ModalResult:= mrNone;
       end
     else    }
    if renCode <> 0 then
    begin
      {
      /////// Parameters
      SetLength(argNames, 3);
      SetLength(args, 3);

      argNames[0] := 'yearGen';
      args[0] := edtYearGen.Text;

      argNames[1] := 'monthGen';
      args[1] := IntToStr(edtMonthGen.ItemIndex + 1);

      argNames[2] := 'departmentCode';
      args[2] := IntToStr(renCode);
      ///////

      reportName := 'NPZ_dodat4/addition4';

      makeReport(reportName, argNames, args, 'xls');
      }
    end
    else
    begin
      Application.MessageBox(PChar('ƒл€ формуванн€ зв≥ту необх≥дно обов''€зково вибрати п≥дрозд≥л!!!'), PChar('”вага!'),MB_ICONWARNING);
      if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
      ModalResult:= mrNone;
    end;
end;

procedure TfrmENPeriodWithDepartment.spbFINExecutorClick(Sender: TObject);
//var frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
 {
 function getFullExecutorName(node : TTreeNode) : String;
 var
   outStr : String;
   tmpNode : TTreeNode;
 begin
  tmpNode := node;
  outStr := '';
   while  tmpNode <> nil do
   begin

      if  FINExecutorShort(tmpNode.Data).finKindName <> '' then
      begin
          if length(outStr) = 0 then
            outStr := FINExecutorShort(tmpNode.Data).name
          else
            outStr := outStr + ' ' + FINExecutorShort(tmpNode.Data).name ;
      end;

      if tmpNode.Parent <> nil then
        if tmpNode.Parent.Level = 0 then
          break;

      tmpNode := tmpNode.Parent;
   end;

   result := outStr;
 end;
 // end getFullExecutorName
 }
begin
{   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkObj.finExecutor = nil then ENPlanWorkObj.finExecutor := FINExecutor.Create();
               ENPlanWorkObj.finExecutor.name := getFullExecutorName(tvDep.Selected) ; //FINExecutorShort(tvDep.Selected.Data).name;
               ENPlanWorkObj.finExecutor.finCode := FINExecutorShort(tvDep.Selected.Data).finCode;
               ENPlanWorkObj.finExecutor.finTypeName := FINExecutorShort(tvDep.Selected.Data).finTypeName;
               ENPlanWorkObj.finExecutor.finTypeCode := FINExecutorShort(tvDep.Selected.Data).finTypeCode;
               ENPlanWorkObj.finExecutor.finKindName := FINExecutorShort(tvDep.Selected.Data).finKindName;
               ENPlanWorkObj.finExecutor.finKindCode := FINExecutorShort(tvDep.Selected.Data).finKindCode;
               ENPlanWorkObj.finExecutor.finCehName := FINExecutorShort(tvDep.Selected.Data).finCehName;
               ENPlanWorkObj.finExecutor.finCehCode := FINExecutorShort(tvDep.Selected.Data).finCehCode;
               edtFINExecutorName.Text := ENPlanWorkObj.finExecutor.name ;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;}
end;

procedure TfrmENPeriodWithDepartment.FormShow(Sender: TObject);
begin
  DisableControls([edtEPRenName, edtFINExecutorName]);
  DenyBlankValues([edtEPRenName]);
end;

end.
